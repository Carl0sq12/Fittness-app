import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/activity_datasource_impl.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../data/services/tts_service.dart';
import '../../../history/domain/entities/activity_record.dart';
import '../../../history/domain/repositories/activity_repository.dart';

// ═══ EVENTOS ════════════════════════════════════════════════════════

abstract class ActivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityStarted  extends ActivityEvent {}
class ActivityStopped  extends ActivityEvent {}

class ActivityChanged extends ActivityEvent {
  final ActivityState state;
  final int stepCount;
  ActivityChanged(this.state, this.stepCount);
  @override
  List<Object?> get props => [state, stepCount];
}

class FallDetected extends ActivityEvent {
  final FallEvent event;
  FallDetected(this.event);
  @override
  List<Object?> get props => [event];
}

class FallConfirmed extends ActivityEvent {}
class FallDismissed  extends ActivityEvent {}

// ═══ ESTADOS ════════════════════════════════════════════════════════

abstract class ActivityBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityInitial extends ActivityBlocState {}

class ActivityTracking extends ActivityBlocState {
  final ActivityState current;
  final int steps;
  final int walkingSteps;      // ← NUEVO
  final int runningSteps;      // ← NUEVO
  final int stationarySeconds; // ← NUEVO
  final double distanceKm;
  final double calories;
  final Duration elapsed;
  final int fallCount;

  ActivityTracking({
    required this.current,
    this.steps = 0,
    this.walkingSteps = 0,
    this.runningSteps = 0,
    this.stationarySeconds = 0,
    this.distanceKm = 0,
    this.calories = 0,
    this.elapsed = Duration.zero,
    this.fallCount = 0,
  });

  @override
  List<Object?> get props => [
    current, steps, walkingSteps, runningSteps,
    stationarySeconds, distanceKm, calories, elapsed, fallCount,
  ];
}

class FallAlert extends ActivityBlocState {
  final FallEvent event;
  FallAlert(this.event);
  @override
  List<Object?> get props => [event];
}

class FallResolved extends ActivityBlocState {}

class ActivitySessionSaved extends ActivityBlocState {
  final ActivityRecord record;
  ActivitySessionSaved(this.record);
  @override
  List<Object?> get props => [record];
}

// ═══ BLOC ════════════════════════════════════════════════════════════

class ActivityBloc extends Bloc<ActivityEvent, ActivityBlocState> {
  final ActivityDataSourceImpl _dataSource;
  final TtsService _ttsService;
  final ActivityRepository _repository;

  StreamSubscription<ActivityUpdate>? _activitySub;
  StreamSubscription<FallEvent>? _fallSub;
  Timer? _sessionTimer;
  Timer? _debounceTimer;

  DateTime? _sessionStart;

  // ── Contadores globales de la sesión ──────────────────────────────
  int _sessionSteps          = 0;
  int _walkingSteps          = 0;   // ← NUEVO
  int _runningSteps          = 0;   // ← NUEVO
  int _stationarySeconds     = 0;   // ← NUEVO
  double _sessionDistanceKm  = 0;
  Duration _sessionElapsed   = Duration.zero;
  int _sessionFallCount      = 0;

  // ── Tracking por tipo para calcular deltas ───────────────────────
  int _lastTotalSteps                  = 0;          // ← NUEVO
  UserActivityType? _lastActivityType;               // ← NUEVO
  DateTime? _stationaryStart;                        // ← NUEVO

  final Map<UserActivityType, int> _activityCount = {};
  ActivityTracking? _lastTrackingState;

  static const Duration _debounceDuration = Duration(milliseconds: 300);
  UserActivityType? _lastAnnouncedType;
  UserActivityType? _pendingType;

  ActivityBloc({
    required ActivityDataSourceImpl dataSource,
    required TtsService ttsService,
    required ActivityRepository repository,
  })  : _dataSource = dataSource,
        _ttsService = ttsService,
        _repository = repository,
        super(ActivityInitial()) {
    on<ActivityStarted>(_onStarted);
    on<ActivityStopped>(_onStopped);
    on<ActivityChanged>(_onActivityChanged);
    on<FallDetected>(_onFallDetected);
    on<FallConfirmed>(_onFallConfirmed);
    on<FallDismissed>(_onFallDismissed);
  }

  // ─────────────────────────────────────────────────────────────────
  // HELPERS de desglose
  // ─────────────────────────────────────────────────────────────────

  /// Acumula los pasos nuevos al tipo de actividad activo ANTES del cambio.
  void _accumulateSteps(int newTotalSteps) {
    final delta = newTotalSteps - _lastTotalSteps;
    if (delta <= 0) return;

    switch (_lastActivityType) {
      case UserActivityType.walking:
        _walkingSteps += delta;
        break;
      case UserActivityType.running:
        _runningSteps += delta;
        break;
      default:
        // Stationary / unknown: los pasos no se atribuyen a ningún tipo
        break;
    }
    _lastTotalSteps = newTotalSteps;
  }

  /// Acumula el tiempo transcurrido en modo quieto.
  void _flushStationaryTime() {
    if (_lastActivityType == UserActivityType.stationary &&
        _stationaryStart != null) {
      _stationarySeconds +=
          DateTime.now().difference(_stationaryStart!).inSeconds;
      _stationaryStart = null;
    }
  }

  /// Llama a ambos helpers cuando cambia el tipo de actividad.
  void _onActivityTypeChanged(UserActivityType newType, int newTotalSteps) {
    _accumulateSteps(newTotalSteps);
    _flushStationaryTime();

    _lastActivityType = newType;

    if (newType == UserActivityType.stationary) {
      _stationaryStart = DateTime.now();
    }
  }

  // ─────────────────────────────────────────────────────────────────

  Future<void> _onStarted(
    ActivityStarted event,
    Emitter<ActivityBlocState> emit,
  ) async {
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) return;

    await _ttsService.init();

    _sessionStart         = DateTime.now();
    _sessionSteps         = 0;
    _walkingSteps         = 0;
    _runningSteps         = 0;
    _stationarySeconds    = 0;
    _sessionDistanceKm    = 0;
    _sessionElapsed       = Duration.zero;
    _sessionFallCount     = 0;
    _lastTotalSteps       = 0;
    _lastActivityType     = null;
    _stationaryStart      = null;
    _lastTrackingState    = null;
    _activityCount.clear();

    await _dataSource.startTracking();

    final initial = ActivityTracking(
      current: ActivityState(
        type: UserActivityType.unknown,
        detectedAt: DateTime.now(),
      ),
    );
    _lastTrackingState = initial;
    emit(initial);

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state is ActivityTracking) {
        // Acumular tiempo quieto en cada tick del timer
        if (_lastActivityType == UserActivityType.stationary &&
            _stationaryStart != null) {
          final live = DateTime.now().difference(_stationaryStart!).inSeconds;
          final liveTotal = _stationarySeconds + live;

          _sessionElapsed = DateTime.now().difference(_sessionStart!);
          final updated = ActivityTracking(
            current: (state as ActivityTracking).current,
            steps: _sessionSteps,
            walkingSteps: _walkingSteps,
            runningSteps: _runningSteps,
            stationarySeconds: liveTotal,
            distanceKm: _sessionDistanceKm,
            calories: _sessionSteps * 0.04,
            elapsed: _sessionElapsed,
            fallCount: _sessionFallCount,
          );
          _lastTrackingState = updated;
          emit(updated);
        } else {
          _sessionElapsed = DateTime.now().difference(_sessionStart!);
          final current = state as ActivityTracking;
          final updated = ActivityTracking(
            current: current.current,
            steps: _sessionSteps,
            walkingSteps: _walkingSteps,
            runningSteps: _runningSteps,
            stationarySeconds: _stationarySeconds,
            distanceKm: _sessionDistanceKm,
            calories: _sessionSteps * 0.04,
            elapsed: _sessionElapsed,
            fallCount: _sessionFallCount,
          );
          _lastTrackingState = updated;
          emit(updated);
        }
      }
    });

    _activitySub = _dataSource.activityStream.listen((update) {
      add(ActivityChanged(update.state, update.stepCount));
    });

    _fallSub = _dataSource.fallStream.listen((fallEvent) {
      add(FallDetected(fallEvent));
    });
  }

  Future<void> _onStopped(
    ActivityStopped event,
    Emitter<ActivityBlocState> emit,
  ) async {
    // Flush final antes de guardar
    _accumulateSteps(_sessionSteps);
    _flushStationaryTime();

    await _cancelSubscriptions();
    await _dataSource.stopTracking();

    if (_sessionStart == null) {
      emit(ActivityInitial());
      return;
    }

    final endTime = DateTime.now();
    final duration = endTime.difference(_sessionStart!);

    final dominant = _activityCount.entries.isEmpty
        ? 'stationary'
        : (_activityCount.entries
              .reduce((a, b) => a.value >= b.value ? a : b)
              .key
              .name);

    final record = ActivityRecord(
      activityType: dominant,
      steps: _sessionSteps,
      distanceKm: _sessionDistanceKm,
      calories: _sessionSteps * 0.04,
      duration: duration,
      startedAt: _sessionStart!,
      endedAt: endTime,
      fallCount: _sessionFallCount,
      walkingSteps: _walkingSteps,
      runningSteps: _runningSteps,
      stationarySeconds: _stationarySeconds,
    );

    await _repository.insert(record);
    emit(ActivitySessionSaved(record));

    await Future<void>.delayed(const Duration(seconds: 2));
    emit(ActivityInitial());
  }

  void _onActivityChanged(
    ActivityChanged event,
    Emitter<ActivityBlocState> emit,
  ) {
    final incoming = event.state.type;
    final newTotalSteps = event.stepCount;

    // Acumular pasos/tiempo del tipo ANTERIOR antes de cambiar
    if (incoming != _lastActivityType &&
        incoming != UserActivityType.unknown) {
      _onActivityTypeChanged(incoming, newTotalSteps);
    } else {
      // Mismo tipo: solo acumular pasos nuevos
      _accumulateSteps(newTotalSteps);
    }

    _sessionSteps      = newTotalSteps;
    _sessionDistanceKm = _sessionSteps * 0.00075;

    if (incoming != UserActivityType.unknown) {
      _activityCount[incoming] = (_activityCount[incoming] ?? 0) + 1;
    }

    if (state is FallAlert) return;

    if (incoming != _pendingType) {
      _debounceTimer?.cancel();
      _pendingType = incoming;
      if (incoming != UserActivityType.unknown) {
        _debounceTimer = Timer(_debounceDuration, () {
          final pending = _pendingType;
          if (pending != null &&
              pending != _lastAnnouncedType &&
              pending != UserActivityType.unknown) {
            _ttsService.speak(_voiceMessageFor(pending));
            _lastAnnouncedType = pending;
          }
        });
      }
    }

    final updated = ActivityTracking(
      current: event.state,
      steps: _sessionSteps,
      walkingSteps: _walkingSteps,
      runningSteps: _runningSteps,
      stationarySeconds: _stationarySeconds,
      distanceKm: _sessionDistanceKm,
      calories: _sessionSteps * 0.04,
      elapsed: _sessionElapsed,
      fallCount: _sessionFallCount,
    );
    _lastTrackingState = updated;
    emit(updated);
  }

  Future<void> _onFallDetected(
    FallDetected event,
    Emitter<ActivityBlocState> emit,
  ) async {
    _sessionFallCount++;
    _debounceTimer?.cancel();
    _pendingType = null;
    await _ttsService.speak(
        '¡Atención! Se detectó una posible caída. ¿Estás bien?');
    emit(FallAlert(event.event));
  }

  Future<void> _onFallConfirmed(
    FallConfirmed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak(
        'Me alegra que estés bien. Continuando el seguimiento.');
    if (_lastTrackingState != null) {
      final restored = ActivityTracking(
        current: _lastTrackingState!.current,
        steps: _sessionSteps,
        walkingSteps: _walkingSteps,
        runningSteps: _runningSteps,
        stationarySeconds: _stationarySeconds,
        distanceKm: _sessionDistanceKm,
        calories: _sessionSteps * 0.04,
        elapsed: _sessionElapsed,
        fallCount: _sessionFallCount,
      );
      _lastTrackingState = restored;
      emit(restored);
    } else {
      emit(FallResolved());
    }
  }

  Future<void> _onFallDismissed(
    FallDismissed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak(
        'Entendido. Por favor busca ayuda de inmediato.');
    if (_lastTrackingState != null) {
      final restored = ActivityTracking(
        current: _lastTrackingState!.current,
        steps: _sessionSteps,
        walkingSteps: _walkingSteps,
        runningSteps: _runningSteps,
        stationarySeconds: _stationarySeconds,
        distanceKm: _sessionDistanceKm,
        calories: _sessionSteps * 0.04,
        elapsed: _sessionElapsed,
        fallCount: _sessionFallCount,
      );
      _lastTrackingState = restored;
      emit(restored);
    } else {
      emit(FallResolved());
    }
  }

  String _voiceMessageFor(UserActivityType type) {
    switch (type) {
      case UserActivityType.walking:    return 'Estás caminando';
      case UserActivityType.running:    return 'Estás corriendo';
      case UserActivityType.stationary: return 'Te has detenido';
      case UserActivityType.unknown:    return '';
    }
  }

  Future<void> _cancelSubscriptions() async {
    _sessionTimer?.cancel();
    _sessionTimer = null;
    await _activitySub?.cancel();
    await _fallSub?.cancel();
    _activitySub = null;
    _fallSub = null;
    _debounceTimer?.cancel();
    _debounceTimer = null;
    _lastAnnouncedType = null;
    _pendingType = null;
  }

  @override
  Future<void> close() async {
    await _cancelSubscriptions();
    await _dataSource.stopTracking();
    _ttsService.dispose();
    return super.close();
  }
}