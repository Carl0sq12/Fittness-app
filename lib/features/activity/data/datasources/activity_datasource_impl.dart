import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../../auth/domain/entities/step_data.dart' show ActivityType;
import '../../../auth/data/datasources/accelerometer_datasource.dart';

class ActivityUpdate {
  final ActivityState state;
  final int stepCount;
  const ActivityUpdate({required this.state, required this.stepCount});
}

class ActivityDataSourceImpl {
  final AccelerometerDataSource _accelerometerDataSource;

  ActivityDataSourceImpl(this._accelerometerDataSource);

  // Umbral reducido a 28.0: detecta caídas desde posición estática.
  // El buffer de 3 muestras promediaba el pico y lo perdía → eliminado.
  static const double _fallThreshold = 28.0;
  static const Duration _fallCooldown = Duration(seconds: 3);
  DateTime? _lastFallTime;

  Future<void> startTracking() async {
    _accelerometerDataSource.resetStepCount();
    await _accelerometerDataSource.startCounting();
  }

  Future<void> stopTracking() async {
    await _accelerometerDataSource.stopCounting();
  }

  Stream<ActivityUpdate> get activityStream {
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
      return ActivityUpdate(
        state: ActivityState(type: type, detectedAt: DateTime.now()),
        stepCount: stepData.stepCount,
      );
    });
  }

  Stream<FallEvent> get fallStream {
    return accelerometerEventStream().where((AccelerometerEvent e) {            
      // Sin buffer: evalúa cada muestra directamente para no perder el pico.
      final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
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
      return FallEvent(magnitude: magnitude, occurredAt: DateTime.now());
    });
  }

  Future<bool> requestPermissions() async {
    final activity = await Permission.activityRecognition.request();
    final sensors  = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }
}