import 'dart:async';

import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform;

// ✅ Plugin geolocator: provee Geolocator, Position, LocationSettings,
// AndroidSettings, AppleSettings, LocationPermission
import 'package:geolocator/geolocator.dart';

import '../../domain/entities/location_point.dart';

abstract class GpsDataSource {
  Future<LocationPoint?> getCurrentLocation();
  Stream<LocationPoint> get locationStream;
  Future<bool> isGpsEnabled();
  Future<bool> requestPermissions();
  Future<bool> openLocationSettings();
}

class GpsDataSourceImpl implements GpsDataSource {

  // Clases del plugin: configuración genérica (fallback)
  static const LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 0,
    timeLimit: Duration(seconds: 15),
  );

  // Clase del plugin: configuración específica Android
  static AndroidSettings get _androidSettings => AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 0,
        intervalDuration: const Duration(milliseconds: 300),
        forceLocationManager: false,
      );

  // Clase del plugin: configuración específica iOS
  static AppleSettings get _appleSettings => AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        distanceFilter: 0,
        pauseLocationUpdatesAutomatically: false,
        showBackgroundLocationIndicator: true,
      );

  LocationSettings get _platformSettings {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _androidSettings;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _appleSettings;
    }
    return _locationSettings;
  }

  Stream<LocationPoint>? _sharedStream;

  @override
  Stream<LocationPoint> get locationStream {
    //  Llamada al plugin: abre el stream de posición GPS continuo
    _sharedStream ??= Geolocator.getPositionStream(
      locationSettings: _platformSettings,
    )
    .where((Position p) => p.accuracy <= 35.0) // Position es clase del plugin
    .map(_positionToPoint)
    .asBroadcastStream();

    return _sharedStream!;
  }

  @override
  Future<LocationPoint?> getCurrentLocation() async {
    try {
      //  Llamada al plugin: obtiene la posición actual una sola vez
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        timeLimit: const Duration(seconds: 10),
      );

      if (position.accuracy > 35.0) return null;
      return _positionToPoint(position);

    } on TimeoutException {
      //  Llamada al plugin: si hay timeout, intenta con la última posición conocida
      final Position? last = await Geolocator.getLastKnownPosition();
      if (last == null) return null;
      if (last.accuracy > 35.0) return null;
      return _positionToPoint(last);

    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> isGpsEnabled() async {
    // ✅ Llamada al plugin: verifica si el GPS del dispositivo está activado
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> requestPermissions() async {
    // ✅ Llamada al plugin: consulta el permiso actual
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // ✅ Llamada al plugin: muestra el diálogo de permisos al usuario
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<bool> openLocationSettings() async {
    // ✅ Llamada al plugin: abre la pantalla de configuración de ubicación del SO
    return Geolocator.openLocationSettings();
  }

  // Convierte Position (clase del plugin) a LocationPoint (entidad propia)
  LocationPoint _positionToPoint(Position p) {
    return LocationPoint(
      latitude: p.latitude,
      longitude: p.longitude,
      altitude: p.altitude,
      speed: p.speed < 0 ? 0 : p.speed,
      accuracy: p.accuracy,
      timestamp: p.timestamp,
    );
  }
}