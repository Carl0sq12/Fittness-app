import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/activity_datasource_impl.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../data/services/tts_service.dart';

// ═══════════════════════════════════════════════════════════════
// EVENTOS
// ═══════════════════════════════════════════════════════════════

abstract class ActivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// El usuario presionó "Iniciar"
class ActivityStarted extends ActivityEvent {}

/// El usuario presionó "Detener"
class ActivityStopped extends ActivityEvent {}

/// Llegó un nuevo estado del stream de actividad
class ActivityChanged extends ActivityEvent {
  final ActivityState state;
  ActivityChanged(this.state);

  @override
  List<Object?> get props => [state];
}

/// El acelerómetro detectó una caída
class FallDetected extends ActivityEvent {
  final FallEvent event;
  FallDetected(this.event);

  @override
  List<Object?> get props => [event];
}

/// El usuario respondió "Estoy bien" en el diálogo
class FallConfirmed extends ActivityEvent {}

/// El usuario respondió "Necesito ayuda" en el diálogo
class FallDismissed extends ActivityEvent {}

// ═══════════════════════════════════════════════════════════════
// ESTADOS
// ═══════════════════════════════════════════════════════════════

abstract class ActivityBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Estado inicial antes de iniciar el tracking
class ActivityInitial extends ActivityBlocState {}

/// Tracking activo con el estado actual del usuario
class ActivityTracking extends ActivityBlocState {
  final ActivityState current;
  ActivityTracking(this.current);

  @override
  List<Object?> get props => [current];
}

/// Se detectó una caída — la UI debe mostrar el diálogo
class FallAlert extends ActivityBlocState {
  final FallEvent event;
  FallAlert(this.event);

  @override
  List<Object?> get props => [event];
}

/// El usuario confirmó que está bien — volver al tracking
class FallResolved extends ActivityBlocState {}

// ═══════════════════════════════════════════════════════════════
// BLOC
// ═══════════════════════════════════════════════════════════════

class ActivityBloc extends Bloc<ActivityEvent, ActivityBlocState> {
  final ActivityDataSourceImpl _dataSource;
  final TtsService _ttsService;

  StreamSubscription<ActivityState>? _activitySub;
  StreamSubscription<FallEvent>? _fallSub;

  // ── Debounce de voz ──────────────────────────────────────────
  // Solo se anuncia un cambio si el nuevo estado se mantuvo
  // estable durante 3 segundos y es diferente al último anunciado.
  // Justificación: el acelerómetro oscila entre walking/stationary
  // en milisegundos al dar un paso. 3s garantiza estabilidad real.
  static const Duration _debounceDuration = Duration(milliseconds: 1500);

  UserActivityType? _lastAnnouncedType;
  UserActivityType? _pendingType;
  Timer? _debounceTimer;

  ActivityBloc({
    required ActivityDataSourceImpl dataSource,
    required TtsService ttsService,
  })  : _dataSource = dataSource,
        _ttsService = ttsService,
        super(ActivityInitial()) {
    on<ActivityStarted>(_onStarted);
    on<ActivityStopped>(_onStopped);
    on<ActivityChanged>(_onActivityChanged);
    on<FallDetected>(_onFallDetected);
    on<FallConfirmed>(_onFallConfirmed);
    on<FallDismissed>(_onFallDismissed);
  }

  // ── Iniciar tracking ─────────────────────────────────────────
  Future<void> _onStarted(
    ActivityStarted event,
    Emitter<ActivityBlocState> emit,
  ) async {
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) {
      return;
    }

    await _ttsService.init();

    emit(ActivityTracking(ActivityState(
      type: UserActivityType.unknown,
      detectedAt: DateTime.now(),
    )));

    // Suscribirse al stream de actividad
    _activitySub = _dataSource.activityStream.listen((activityState) {
      add(ActivityChanged(activityState));
    });

    // Suscribirse al stream de caídas
    _fallSub = _dataSource.fallStream.listen((fallEvent) {
      add(FallDetected(fallEvent));
    });
  }

  // ── Detener tracking ─────────────────────────────────────────
  Future<void> _onStopped(
    ActivityStopped event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _cancelSubscriptions();
    emit(ActivityInitial());
  }

  // ── Nuevo estado de actividad ─────────────────────────────────
  void _onActivityChanged(
    ActivityChanged event,
    Emitter<ActivityBlocState> emit,
  ) {
    // Si estamos en medio de una alerta de caída, ignoramos los cambios de actividad
    // para evitar interrumpir la alerta de caída o emitir anuncios de voz contradictorios.
    if (state is FallAlert) {
      return;
    }

    final incoming = event.state.type;

    if (incoming != _lastAnnouncedType) {
      if (incoming != _pendingType) {
        _debounceTimer?.cancel();
        _pendingType = incoming;

        if (incoming != UserActivityType.unknown) {
          _debounceTimer = Timer(_debounceDuration, () {
            if (_pendingType == incoming && _pendingType != _lastAnnouncedType) {
              _ttsService.speak(event.state.voiceMessage);
              _lastAnnouncedType = _pendingType;
            }
          });
        }
      }
    } else {
      _debounceTimer?.cancel();
      _pendingType = null;
    }

    emit(ActivityTracking(event.state));
  }

  // ── Caída detectada ──────────────────────────────────────────
  Future<void> _onFallDetected(
    FallDetected event,
    Emitter<ActivityBlocState> emit,
  ) async {
    // Cancelar cualquier anuncio de actividad pendiente inmediatamente
    _debounceTimer?.cancel();
    _pendingType = null;

    await _ttsService.speak('¡Atención! Se detectó una posible caída. ¿Estás bien?');
    emit(FallAlert(event.event));
  }

  // ── Usuario respondió "Estoy bien" ───────────────────────────
  Future<void> _onFallConfirmed(
    FallConfirmed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak('Me alegra que estés bien. Continuando el seguimiento.');
    emit(FallResolved());
  }

  // ── Usuario respondió "Necesito ayuda" ───────────────────────
  Future<void> _onFallDismissed(
    FallDismissed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak('Entendido. Por favor busca ayuda de inmediato.');
    emit(FallResolved());
  }

  // ── Limpieza ──────────────────────────────────────────────────
  Future<void> _cancelSubscriptions() async {
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
    _ttsService.dispose();
    return super.close();
  }
}