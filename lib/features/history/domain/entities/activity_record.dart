import 'package:equatable/equatable.dart';

class ActivityRecord extends Equatable {
  final int? id;
  final String activityType;
  final int steps;
  final double distanceKm;
  final double calories;
  final Duration duration;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? notes;
  final int fallCount;
  final int walkingSteps;      // ← NUEVO
  final int runningSteps;      // ← NUEVO
  final int stationarySeconds; // ← NUEVO

  const ActivityRecord({
    this.id,
    required this.activityType,
    required this.steps,
    required this.distanceKm,
    required this.calories,
    required this.duration,
    required this.startedAt,
    this.endedAt,
    this.notes,
    this.fallCount = 0,
    this.walkingSteps = 0,      // ← NUEVO
    this.runningSteps = 0,      // ← NUEVO
    this.stationarySeconds = 0, // ← NUEVO
  });

  ActivityRecord copyWith({
    int? id,
    String? activityType,
    int? steps,
    double? distanceKm,
    double? calories,
    Duration? duration,
    DateTime? startedAt,
    DateTime? endedAt,
    String? notes,
    int? fallCount,
    int? walkingSteps,
    int? runningSteps,
    int? stationarySeconds,
  }) {
    return ActivityRecord(
      id: id ?? this.id,
      activityType: activityType ?? this.activityType,
      steps: steps ?? this.steps,
      distanceKm: distanceKm ?? this.distanceKm,
      calories: calories ?? this.calories,
      duration: duration ?? this.duration,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      notes: notes ?? this.notes,
      fallCount: fallCount ?? this.fallCount,
      walkingSteps: walkingSteps ?? this.walkingSteps,
      runningSteps: runningSteps ?? this.runningSteps,
      stationarySeconds: stationarySeconds ?? this.stationarySeconds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'activityType': activityType,
      'steps': steps,
      'distanceKm': distanceKm,
      'calories': calories,
      'durationSeconds': duration.inSeconds,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'notes': notes,
      'fallCount': fallCount,
      'walkingSteps': walkingSteps,
      'runningSteps': runningSteps,
      'stationarySeconds': stationarySeconds,
    };
  }

  factory ActivityRecord.fromMap(Map<String, dynamic> map) {
    return ActivityRecord(
      id: map['id'] as int?,
      activityType: map['activityType'] as String,
      steps: map['steps'] as int,
      distanceKm: (map['distanceKm'] as num).toDouble(),
      calories: (map['calories'] as num).toDouble(),
      duration: Duration(seconds: map['durationSeconds'] as int),
      startedAt: DateTime.parse(map['startedAt'] as String),
      endedAt: map['endedAt'] != null
          ? DateTime.parse(map['endedAt'] as String)
          : null,
      notes: map['notes'] as String?,
      fallCount: (map['fallCount'] as int?) ?? 0,
      walkingSteps: (map['walkingSteps'] as int?) ?? 0,
      runningSteps: (map['runningSteps'] as int?) ?? 0,
      stationarySeconds: (map['stationarySeconds'] as int?) ?? 0,
    );
  }

  String get formattedDuration {
    final h = duration.inHours;
    final m = duration.inMinutes.remainder(60);
    final s = duration.inSeconds.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get formattedStationaryTime {
    final m = stationarySeconds ~/ 60;
    final s = stationarySeconds.remainder(60);
    if (m > 0) return '${m}m ${s}s';
    return '${s}s';
  }

  String get activityLabel {
    switch (activityType) {
      case 'walking': return 'Caminata';
      case 'running': return 'Carrera';
      default:        return 'Actividad';
    }
  }

  @override
  List<Object?> get props => [
    id, activityType, steps, distanceKm, calories,
    duration, startedAt, endedAt, notes, fallCount,
    walkingSteps, runningSteps, stationarySeconds,
  ];
}