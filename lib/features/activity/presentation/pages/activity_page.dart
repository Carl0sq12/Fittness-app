import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/activity_bloc.dart';
import '../../domain/entities/activity_state.dart';
import '../../data/datasources/activity_datasource_impl.dart';
import '../../../../../injection_container.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  void initState() {
    super.initState();
    _requestPermissionsAndStart();
  }

  Future<void> _requestPermissionsAndStart() async {
    final datasource = sl<ActivityDataSourceImpl>();
    final granted = await datasource.requestPermissions();
    if (!mounted) return;
    if (granted) {
      context.read<ActivityBloc>().add(ActivityStarted());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permisos denegados. Activa "Actividad física" y "Sensores corporales" en Ajustes.',
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 6),
        ),
      );
    }
  }

  void _showFallDialog(BuildContext context, FallAlert state) {
    bool showSecondary = false;
    Timer? secondaryTimer;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            secondaryTimer ??= Timer(const Duration(seconds: 15), () {
              setDialogState(() => showSecondary = true);
            });

            return AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.orange, size: 28),
                  SizedBox(width: 8),
                  Text('¿Estás bien?'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Se detectó una posible caída.'),
                  const SizedBox(height: 8),
                  if (showSecondary)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        '¡Por favor responde! ¿Necesitas ayuda?',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    secondaryTimer?.cancel();
                    context.read<ActivityBloc>().add(FallConfirmed());
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Estoy bien'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    secondaryTimer?.cancel();
                    context.read<ActivityBloc>().add(FallDismissed());
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Necesito ayuda'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de Actividad'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocListener<ActivityBloc, ActivityBlocState>(
        listener: (context, state) {
          if (state is FallAlert) {
            _showFallDialog(context, state);
          }
          if (state is ActivitySessionSaved) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Sesión guardada: ${state.record.steps} pasos · '
                          '${state.record.distanceKm.toStringAsFixed(2)} km · '
                          '${state.record.calories.toStringAsFixed(0)} cal'
                          '${state.record.fallCount > 0 ? ' · ${state.record.fallCount} caída${state.record.fallCount > 1 ? 's' : ''}' : ''}',
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
          }
        },
        child: BlocBuilder<ActivityBloc, ActivityBlocState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      _getIcon(state),
                      size: 100,
                      color: const Color(0xFF6366F1),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getLabel(state),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 32),

                    if (state is ActivityTracking) ...[
                      // Fila superior: totales
                      _buildStatsRow(state),
                      const SizedBox(height: 12),
                      // Desglose por tipo de actividad ← NUEVO
                      _buildBreakdownRow(state),
                      const SizedBox(height: 8),
                      Text(
                        '⏱ ${_formatDuration(state.elapsed)}',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey[600]),
                      ),
                      if (state.fallCount > 0) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.orange.shade300),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.warning_amber_rounded,
                                  size: 16,
                                  color: Colors.orange.shade700),
                              const SizedBox(width: 6),
                              Text(
                                '${state.fallCount} caída${state.fallCount > 1 ? 's' : ''} detectada${state.fallCount > 1 ? 's' : ''} en esta sesión',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 32),
                    ],

                    if (state is ActivitySessionSaved) ...[
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.green, size: 48),
                            const SizedBox(height: 8),
                            const Text(
                              'Sesión guardada en historial',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],

                    ElevatedButton.icon(
                      onPressed: state is ActivitySessionSaved
                          ? null
                          : () {
                              if (state is ActivityTracking) {
                                context
                                    .read<ActivityBloc>()
                                    .add(ActivityStopped());
                              } else {
                                _requestPermissionsAndStart();
                              }
                            },
                      icon: Icon(
                        state is ActivityTracking
                            ? Icons.stop
                            : Icons.play_arrow,
                      ),
                      label: Text(
                        state is ActivityTracking ? 'Detener' : 'Iniciar',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state is ActivityTracking
                            ? Colors.red
                            : Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ── Fila de totales (igual que antes + caídas) ────────────────────
  Widget _buildStatsRow(ActivityTracking state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem(Icons.directions_walk, state.steps.toString(), 'pasos'),
          _statItem(Icons.straighten,
              state.distanceKm.toStringAsFixed(2), 'km'),
          _statItem(Icons.local_fire_department,
              state.calories.toStringAsFixed(0), 'cal'),
          _statItem(
            Icons.warning_amber_rounded,
            state.fallCount.toString(),
            'caídas',
            color: state.fallCount > 0
                ? Colors.orange.shade700
                : Colors.grey[400]!,
          ),
        ],
      ),
    );
  }

  // ── Desglose por tipo ← NUEVO ─────────────────────────────────────
  Widget _buildBreakdownRow(ActivityTracking state) {
    final stationaryMin = state.stationarySeconds ~/ 60;
    final stationarySec = state.stationarySeconds.remainder(60);
    final stationaryLabel = stationaryMin > 0
        ? '${stationaryMin}m ${stationarySec}s'
        : '${stationarySec}s';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem(
            Icons.directions_walk,
            state.walkingSteps.toString(),
            'caminando',
            color: Colors.blue.shade600,
          ),
          Container(
              width: 1, height: 36, color: Colors.grey.shade300),
          _statItem(
            Icons.directions_run,
            state.runningSteps.toString(),
            'corriendo',
            color: Colors.green.shade600,
          ),
          Container(
              width: 1, height: 36, color: Colors.grey.shade300),
          _statItem(
            Icons.accessibility_new,
            stationaryLabel,
            'quieto',
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label,
      {Color? color}) {
    final c = color ?? const Color(0xFF6366F1);
    return Column(
      children: [
        Icon(icon, color: c, size: 20),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: c)),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }

  IconData _getIcon(ActivityBlocState state) {
    if (state is ActivityTracking) {
      switch (state.current.type) {
        case UserActivityType.walking:
          return Icons.directions_walk;
        case UserActivityType.running:
          return Icons.directions_run;
        case UserActivityType.stationary:
          return Icons.accessibility_new;
        case UserActivityType.unknown:
          return Icons.help_outline;
      }
    }
    if (state is ActivitySessionSaved) return Icons.check_circle;
    return Icons.fitness_center;
  }

  String _getLabel(ActivityBlocState state) {
    if (state is ActivityTracking) return state.current.label;
    if (state is ActivitySessionSaved) return 'Guardando...';
    return 'Presiona Iniciar';
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}