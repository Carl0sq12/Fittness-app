import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/history_bloc.dart';
import '../../domain/entities/activity_record.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(HistoryLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Actividad'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Borrar todo',
            onPressed: () => _confirmDeleteAll(context),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Agregar registro',
            onPressed: () => _showRecordDialog(context, null),
          ),
        ],
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HistoryError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(state.message, textAlign: TextAlign.center),
                  TextButton(
                    onPressed: () => context
                        .read<HistoryBloc>()
                        .add(HistoryLoadRequested()),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
          if (state is HistoryLoaded) {
            if (state.records.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history, size: 80, color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text('Sin registros aún',
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey[500])),
                    const SizedBox(height: 8),
                    Text(
                      'Usa el Detector de Actividad para registrar sesiones automáticamente',
                      style: TextStyle(color: Colors.grey[400]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                _buildSummaryCard(state.records),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.records.length,
                    itemBuilder: (context, index) =>
                        _buildRecordCard(context, state.records[index]),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  // ── Tarjeta de resumen global ─────────────────────────────────────
  Widget _buildSummaryCard(List<ActivityRecord> records) {
    final totalSteps    = records.fold(0,   (s, r) => s + r.steps);
    final totalKm       = records.fold(0.0, (s, r) => s + r.distanceKm);
    final totalCalories = records.fold(0.0, (s, r) => s + r.calories);
    final totalFalls    = records.fold(0,   (s, r) => s + r.fallCount);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _summaryItem(Icons.directions_walk,
              totalSteps.toString(), 'Pasos'),
          _summaryItem(Icons.straighten,
              '${totalKm.toStringAsFixed(1)} km', 'Distancia'),
          _summaryItem(Icons.local_fire_department,
              totalCalories.toStringAsFixed(0), 'Calorías'),
          _summaryItem(Icons.event_note,
              records.length.toString(), 'Sesiones'),
          _summaryItem(
            Icons.warning_amber_rounded,
            totalFalls.toString(),
            'Caídas',
            color: totalFalls > 0
                ? Colors.orange.shade200
                : Colors.white70,
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(IconData icon, String value, String label,
      {Color? color}) {
    final c = color ?? Colors.white70;
    return Column(
      children: [
        Icon(icon, color: c, size: 20),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                color: color != null ? color : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }

  // ── Tarjeta de cada registro ──────────────────────────────────────
  Widget _buildRecordCard(BuildContext context, ActivityRecord record) {
    final hasBreakdown = record.walkingSteps > 0 ||
        record.runningSteps > 0 ||
        record.stationarySeconds > 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Cabecera ───────────────────────────────────────────
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      const Color(0xFF6366F1).withValues(alpha: 0.1),
                  child: Icon(
                    _activityIcon(record.activityType),
                    color: const Color(0xFF6366F1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(record.activityLabel,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      Text(
                        '⏱ ${record.formattedDuration} · '
                        '${_formatDate(record.startedAt)}',
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showRecordDialog(context, record);
                    }
                    if (value == 'delete') {
                      _confirmDelete(context, record);
                    }
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                        value: 'edit', child: Text('Editar')),
                    const PopupMenuItem(
                        value: 'delete', child: Text('Eliminar')),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ── Totales de la sesión ───────────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _miniStat(Icons.directions_walk,
                      '${record.steps}', 'pasos'),
                  _miniStat(Icons.straighten,
                      '${record.distanceKm.toStringAsFixed(2)} km',
                      'distancia'),
                  _miniStat(Icons.local_fire_department,
                      '${record.calories.toStringAsFixed(0)}', 'cal'),
                ],
              ),
            ),

            // ── Desglose por tipo ← NUEVO ──────────────────────────
            if (hasBreakdown) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _miniStat(
                      Icons.directions_walk,
                      '${record.walkingSteps}',
                      'caminando',
                      color: Colors.blue.shade600,
                    ),
                    Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey.shade300),
                    _miniStat(
                      Icons.directions_run,
                      '${record.runningSteps}',
                      'corriendo',
                      color: Colors.green.shade600,
                    ),
                    Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey.shade300),
                    _miniStat(
                      Icons.accessibility_new,
                      record.formattedStationaryTime,
                      'quieto',
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ),
            ],

            // ── Badge de caídas ────────────────────────────────────
            if (record.fallCount > 0) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 13, color: Colors.orange.shade700),
                    const SizedBox(width: 4),
                    Text(
                      '${record.fallCount} caída${record.fallCount > 1 ? 's' : ''} '
                      'detectada${record.fallCount > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // ── Notas ──────────────────────────────────────────────
            if (record.notes != null && record.notes!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                '📝 ${record.notes}',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _miniStat(IconData icon, String value, String label,
      {Color? color}) {
    final c = color ?? const Color(0xFF6366F1);
    return Column(
      children: [
        Icon(icon, color: c, size: 16),
        const SizedBox(height: 2),
        Text(value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, color: c)),
        Text(label,
            style:
                TextStyle(fontSize: 10, color: Colors.grey[500])),
      ],
    );
  }

  // ── Diálogo Crear / Editar ────────────────────────────────────────
  void _showRecordDialog(BuildContext context, ActivityRecord? existing) {
    final isEditing = existing != null;
    String selectedType = existing?.activityType ?? 'walking';
    final stepsCtrl = TextEditingController(
        text: existing?.steps.toString() ?? '0');
    final distanceCtrl = TextEditingController(
        text: existing?.distanceKm.toStringAsFixed(2) ?? '0');
    final caloriesCtrl = TextEditingController(
        text: existing?.calories.toStringAsFixed(0) ?? '0');
    final durationCtrl = TextEditingController(
        text: existing?.duration.inMinutes.toString() ?? '0');
    final notesCtrl =
        TextEditingController(text: existing?.notes ?? '');

    showDialog<void>(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title:
                  Text(isEditing ? 'Editar Registro' : 'Nuevo Registro'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: selectedType,
                      decoration: const InputDecoration(
                        labelText: 'Tipo de actividad',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'walking', child: Text('Caminata')),
                        DropdownMenuItem(
                            value: 'running', child: Text('Carrera')),
                        DropdownMenuItem(
                            value: 'stationary',
                            child: Text('Ejercicio estático')),
                      ],
                      onChanged: (v) =>
                          setDialogState(() => selectedType = v!),
                    ),
                    const SizedBox(height: 12),
                    _dialogField(stepsCtrl, 'Pasos',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _dialogField(distanceCtrl, 'Distancia (km)',
                        keyboardType:
                            const TextInputType.numberWithOptions(
                                decimal: true)),
                    const SizedBox(height: 12),
                    _dialogField(caloriesCtrl, 'Calorías',
                        keyboardType:
                            const TextInputType.numberWithOptions(
                                decimal: true)),
                    const SizedBox(height: 12),
                    _dialogField(durationCtrl, 'Duración (minutos)',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _dialogField(notesCtrl, 'Notas (opcional)',
                        maxLines: 2),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final record = ActivityRecord(
                      id: existing?.id,
                      activityType: selectedType,
                      steps: int.tryParse(stepsCtrl.text) ?? 0,
                      distanceKm:
                          double.tryParse(distanceCtrl.text) ?? 0,
                      calories:
                          double.tryParse(caloriesCtrl.text) ?? 0,
                      duration: Duration(
                          minutes:
                              int.tryParse(durationCtrl.text) ?? 0),
                      startedAt:
                          existing?.startedAt ?? DateTime.now(),
                      endedAt: existing?.endedAt,
                      notes: notesCtrl.text.isEmpty
                          ? null
                          : notesCtrl.text,
                      fallCount: existing?.fallCount ?? 0,
                      walkingSteps: existing?.walkingSteps ?? 0,
                      runningSteps: existing?.runningSteps ?? 0,
                      stationarySeconds:
                          existing?.stationarySeconds ?? 0,
                    );
                    if (isEditing) {
                      context
                          .read<HistoryBloc>()
                          .add(HistoryRecordUpdated(record));
                    } else {
                      context
                          .read<HistoryBloc>()
                          .add(HistoryRecordAdded(record));
                    }
                    Navigator.pop(dialogCtx);
                  },
                  child: Text(isEditing ? 'Guardar' : 'Agregar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _dialogField(
    TextEditingController ctrl,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: ctrl,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }

  void _confirmDelete(BuildContext context, ActivityRecord record) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Eliminar registro'),
        content: Text(
            '¿Eliminar la sesión del ${_formatDate(record.startedAt)}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white),
            onPressed: () {
              context
                  .read<HistoryBloc>()
                  .add(HistoryRecordDeleted(record.id!));
              Navigator.pop(dialogCtx);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAll(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Borrar todo el historial'),
        content: const Text(
            '¿Estás seguro? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white),
            onPressed: () {
              context
                  .read<HistoryBloc>()
                  .add(HistoryAllDeleted());
              Navigator.pop(dialogCtx);
            },
            child: const Text('Borrar todo'),
          ),
        ],
      ),
    );
  }

  IconData _activityIcon(String type) {
    switch (type) {
      case 'walking': return Icons.directions_walk;
      case 'running': return Icons.directions_run;
      default:        return Icons.accessibility_new;
    }
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/'
        '${dt.month.toString().padLeft(2, '0')}/'
        '${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }
}