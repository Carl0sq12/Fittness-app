import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../../auth/domain/entities/step_data.dart' show ActivityType;
import '../../../auth/data/datasources/accelerometer_datasource.dart';

class ActivityDataSourceImpl {
  final AccelerometerDataSource _accelerometerDataSource;

  ActivityDataSourceImpl(this._accelerometerDataSource);

  // Umbral de caída: 42.0 m/s²
  // Gravedad normal = 9.8. Un impacto real supera 20. 
  // 42.0 m/s² (~4.3G) da margen para detectar solo impactos reales de caídas y no movimientos de carrera.
  static const double _fallThreshold = 42.0;

  // Cooldown entre caídas: 2 segundos
  // Evita múltiples eventos del mismo impacto (rebote del dispositivo)
  static const Duration _fallCooldown = Duration(seconds: 3);

  DateTime? _lastFallTime;

  // ─── STREAM DE ACTIVIDAD ──────────────────────────────────────────
  // Utiliza el AccelerometerDataSource compartido de la aplicación para mayor estabilidad y sincronía.
  // Esto garantiza consistencia absoluta con la pestaña de inicio y evita fallos o conflictos
  // al registrar múltiples listeners del mismo EventChannel nativo.
  Stream<ActivityState> get activityStream {
    return _accelerometerDataSource.stepStream.map((stepData) {
      UserActivityType type;
      switch (stepData.activityType) {
        case ActivityType.walking:
          type = UserActivityType.walking;
          break;
        case ActivityType.running:
          type = UserActivityType.running;
          break;
        case ActivityType.stationary:
          type = UserActivityType.stationary;
          break;
      }

      return ActivityState(
        type: type,
        detectedAt: DateTime.now(),
      );
    });
  }

  // ─── STREAM DE CAÍDAS ────────────────────────────────────────────
  // Usa sensors_plus para datos crudos del acelerómetro.
  // activity_recognition_flutter NO detecta caídas, por eso
  // necesitamos los dos plugins.
  Stream<FallEvent> get fallStream {
  // Buffer de las últimas 3 lecturas para promedio móvil.
  // El LSM6DST a 100Hz genera mucho ruido puntual.
  // Promediar 3 muestras (~30ms) suaviza sin perder el pico real.
  final List<double> _buffer = [];
  const int _bufferSize = 3;

  return accelerometerEventStream().where((AccelerometerEvent e) {
    final double raw = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);

    // Mantener buffer de tamaño fijo
    _buffer.add(raw);
    if (_buffer.length > _bufferSize) _buffer.removeAt(0);

    // Promedio de las últimas lecturas
    final double magnitude =
        _buffer.reduce((a, b) => a + b) / _buffer.length;

    final DateTime now = DateTime.now();

    if (magnitude < _fallThreshold) return false;

    if (_lastFallTime != null &&
        now.difference(_lastFallTime!) < _fallCooldown) {
      return false;
    }

    _lastFallTime = now;
    return true;
  }).map((AccelerometerEvent e) {
    final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
    return FallEvent(
      magnitude: magnitude,
      occurredAt: DateTime.now(),
    );
  });
}

  // ─── PERMISOS ────────────────────────────────────────────────────
  Future<bool> requestPermissions() async {
    // activityRecognition cubre el ACTIVITY_RECOGNITION del manifest
    // sensors cubre el BODY_SENSORS del manifest
    final activity = await Permission.activityRecognition.request();
    final sensors = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }
}