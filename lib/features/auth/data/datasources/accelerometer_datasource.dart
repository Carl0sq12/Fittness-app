import 'dart:async';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';  //plugin
import '../../domain/entities/step_data.dart';

abstract class AccelerometerDataSource {
  Stream<StepData> get stepStream;
  Future<void> startCounting();
  Future<void> stopCounting();
  Future<bool> requestPermissions();
  void resetStepCount();
}

class AccelerometerDataSourceImpl implements AccelerometerDataSource {
  StreamSubscription<AccelerometerEvent>? _accelSub;
  final StreamController<StepData> _controller =
      StreamController<StepData>.broadcast();

  int _stepCount = 0;
  bool _aboveThreshold = false;
  DateTime? _lastStepTime;

  // Lista corta: solo para conteo en tiempo real (pasos visibles rápido).
  final List<DateTime> _recentSteps = <DateTime>[];

  // Lista separada: solo para clasificar actividad (más estable).
  final List<DateTime> _classifySteps = <DateTime>[];

  static const double _stepThresholdUp = 11.8;
  static const double _stepThresholdDown = 10.2;
  static const int _minMsBetweenSteps = 380;

  // Ventana corta: pasos en tiempo real.
  static const Duration _stepRateWindow = Duration(seconds: 2);

  // Ventana larga SOLO para clasificar caminar/correr: más estable.
  static const Duration _classifyWindow = Duration(seconds: 3);

  // Original: estable para quieto vs caminar.
  static const Duration _walkingHoldTime = Duration(milliseconds: 2500);

  @override
  Stream<StepData> get stepStream => _controller.stream;

  @override
  void resetStepCount() {
    _stepCount = 0;
    _aboveThreshold = false;
    _lastStepTime = null;
    _recentSteps.clear();
    _classifySteps.clear();
  }

  @override
  Future<void> startCounting() async {
    await _accelSub?.cancel();
    _accelSub = null;   //stream del plugin 

    _accelSub = accelerometerEventStream(
      samplingPeriod: SensorInterval.uiInterval,
    ).listen((AccelerometerEvent e) {
      final double mag = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      final DateTime now = DateTime.now();

      final bool cooldownOk = _lastStepTime == null ||
          now.difference(_lastStepTime!).inMilliseconds >= _minMsBetweenSteps;

      if (mag > _stepThresholdUp && !_aboveThreshold && cooldownOk) {
        _aboveThreshold = true;
        _stepCount++;
        _lastStepTime = now;
        // Se agrega a ambas listas.
        _recentSteps.add(now);
        _classifySteps.add(now);
      } else if (mag < _stepThresholdDown) {
        _aboveThreshold = false;
      }

      // Limpia cada lista con su propia ventana.
      _recentSteps.removeWhere(
        (DateTime t) => now.difference(t) > _stepRateWindow,
      );
      _classifySteps.removeWhere(
        (DateTime t) => now.difference(t) > _classifyWindow,
      );

      final ActivityType activity = _classifyActivity(now);
      _controller.add(
        StepData(
          stepCount: _stepCount,
          activityType: activity,
          magnitude: mag,
        ),
      );
    });
  }

  ActivityType _classifyActivity(DateTime now) {
    if (_lastStepTime == null) {
      return ActivityType.stationary;
    }

    final Duration sinceLastStep = now.difference(_lastStepTime!);
    if (sinceLastStep > _walkingHoldTime) {
      return ActivityType.stationary;
    }

    // Usa la ventana larga para clasificar: mucho más estable.
    // Con 4s y pasos consistentes, un paso de más/menos no cambia nada.
    final double stepsPerSecond =
        _classifySteps.length / _classifyWindow.inSeconds;

    // Con ventana de 4s el umbral baja un poco porque
    // la tasa promediada es más real que con 2s.
    if (stepsPerSecond >= 2.0) {
      return ActivityType.running;
    }

    return ActivityType.walking;
  }

  @override
  Future<void> stopCounting() async {
    await _accelSub?.cancel();
    _accelSub = null;
    _recentSteps.clear();
    _classifySteps.clear();
  }

  @override
  Future<bool> requestPermissions() async {
    final PermissionStatus activity =
        await Permission.activityRecognition.request();
    final PermissionStatus sensors = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }

  void dispose() {
    stopCounting();
    _controller.close();
  }
}