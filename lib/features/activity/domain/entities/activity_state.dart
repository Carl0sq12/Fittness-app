import 'package:equatable/equatable.dart';

/// Enum propio de la app (renombrado a UserActivityType
/// para evitar colisión con el enum ActivityType del plugin
/// activity_recognition_flutter)
enum UserActivityType {
  walking,
  running,
  stationary,
  unknown,
}

class ActivityState extends Equatable {
  final UserActivityType type;
  final DateTime detectedAt;

  const ActivityState({
    required this.type,
    required this.detectedAt,
  });

  /// Texto que se muestra en la UI
  String get label {
    switch (type) {
      case UserActivityType.walking:
        return 'Caminando';
      case UserActivityType.running:
        return 'Corriendo';
      case UserActivityType.stationary:
        return 'Detenido';
      case UserActivityType.unknown:
        return 'Detectando...';
    }
  }

  /// Texto que lee flutter_tts en voz alta
  String get voiceMessage {
    switch (type) {
      case UserActivityType.walking:
        return 'Estás caminando';
      case UserActivityType.running:
        return 'Estás corriendo';
      case UserActivityType.stationary:
        return 'Te has detenido';
      case UserActivityType.unknown:
        return '';
    }
  }

  @override
  List<Object?> get props => [type, detectedAt];
}