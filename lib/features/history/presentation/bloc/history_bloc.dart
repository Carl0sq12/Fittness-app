import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/activity_record.dart';
import '../../domain/repositories/activity_repository.dart';

// ═══════════════════════════════════════════════════════════════
// EVENTOS
// ═══════════════════════════════════════════════════════════════

abstract class HistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoryLoadRequested extends HistoryEvent {}

class HistoryRecordAdded extends HistoryEvent {
  final ActivityRecord record;
  HistoryRecordAdded(this.record);
  @override
  List<Object?> get props => [record];
}

class HistoryRecordUpdated extends HistoryEvent {
  final ActivityRecord record;
  HistoryRecordUpdated(this.record);
  @override
  List<Object?> get props => [record];
}

class HistoryRecordDeleted extends HistoryEvent {
  final int id;
  HistoryRecordDeleted(this.id);
  @override
  List<Object?> get props => [id];
}

class HistoryAllDeleted extends HistoryEvent {}

// ═══════════════════════════════════════════════════════════════
// ESTADOS
// ═══════════════════════════════════════════════════════════════

abstract class HistoryState extends Equatable {
  const HistoryState();
  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<ActivityRecord> records;
  const HistoryLoaded(this.records);
  @override
  List<Object?> get props => [records];
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
  @override
  List<Object?> get props => [message];
}

// ═══════════════════════════════════════════════════════════════
// BLOC
// ═══════════════════════════════════════════════════════════════

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ActivityRepository _repository;

  HistoryBloc(this._repository) : super(const HistoryInitial()) {
    on<HistoryLoadRequested>(_onLoad);
    on<HistoryRecordAdded>(_onAdd);
    on<HistoryRecordUpdated>(_onUpdate);
    on<HistoryRecordDeleted>(_onDelete);
    on<HistoryAllDeleted>(_onDeleteAll);
  }

  Future<void> _onLoad(
    HistoryLoadRequested event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryLoading());
    try {
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onAdd(
    HistoryRecordAdded event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.insert(event.record);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onUpdate(
    HistoryRecordUpdated event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.update(event.record);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onDelete(
    HistoryRecordDeleted event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.delete(event.id);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onDeleteAll(
    HistoryAllDeleted event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.deleteAll();
      emit(const HistoryLoaded([]));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}