
import 'package:flutter/material.dart' hide Route;
import 'dart:async';
import '../../data/datasources/gps_datasource.dart';
import '../../domain/entities/location_point.dart';
import '../../../../../injection_container.dart';

class RouteMapWidget extends StatefulWidget {
  const RouteMapWidget({super.key});

  @override
  State<RouteMapWidget> createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  final GpsDataSource _dataSource = sl<GpsDataSource>();
  Route _route = Route();
  GpsKalmanFilter _kalmanFilter = GpsKalmanFilter();

  StreamSubscription<LocationPoint>? _subscription;
  bool _isTracking = false;
  String _statusMessage = 'Presiona Iniciar';

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _toggleTracking() async {
    if (_isTracking) {
      _stopTracking();
    } else {
      await _startTracking();
    }
  }

  Future<void> _startTracking() async {
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) {
      setState(() {
        _statusMessage = 'Permisos denegados';
      });
      _showPermissionDeniedDialog();
      return;
    }

    final gpsEnabled = await _dataSource.isGpsEnabled();
    if (!gpsEnabled) {
      setState(() {
        _statusMessage = 'GPS desactivado';
      });
      final shouldOpen = await _showGpsDisabledDialog();
      if (shouldOpen) {
        await _dataSource.openLocationSettings();
      }
      return;
    }

    setState(() {
      _route = Route();
      _kalmanFilter = GpsKalmanFilter();
      _isTracking = true;
      _statusMessage = 'Buscando señal GPS...';
    });

    // Obtener la ubicación inicial (última conocida) de forma inmediata
    final initialPoint = await _dataSource.getCurrentLocation();
    if (initialPoint != null && _isTracking) {
      // Solo usar punto inicial si tiene buena precisión
      if (initialPoint.accuracy <= 35) {
        final filteredInitial = _kalmanFilter.filter(initialPoint);
        setState(() {
          _route.addPoint(filteredInitial);
          _statusMessage = 'Tracking - ${_route.points.length} puntos';
        });
      }
    }

    _subscription = _dataSource.locationStream.listen(
      (LocationPoint point) {
        print('📍 GPS: ${point.latitude}, ${point.longitude}, acc=${point.accuracy}m');

        // Ignorar puntos de muy baja precisión (como redes de celular en interiores)
        if (point.accuracy > 35) {
          print('⚠️ GPS: Ignorando punto por baja precisión (${point.accuracy}m)');
          return;
        }

        // Filtrar coordenada usando filtro de Kalman
        final filteredPoint = _kalmanFilter.filter(point);

        if (_route.points.isEmpty) {
          setState(() {
            _route.addPoint(filteredPoint);
            _statusMessage = 'Tracking - ${_route.points.length} puntos';
          });
        } else {
          final lastPoint = _route.points.last;
          final distance = lastPoint.distanceTo(filteredPoint);

          if (distance >= 1.5) {
            setState(() {
              _route.addPoint(filteredPoint);
              _statusMessage = 'Tracking - ${_route.points.length} puntos';
            });
          }
        }
      },
      onError: (Object error) {
        print('❌ GPS Error: $error');
        setState(() {
          _statusMessage = 'Error: $error';
        });
      },
    );
  }

  void _stopTracking() {
    _subscription?.cancel();
    _route.finish();

    setState(() {
      _isTracking = false;
      _statusMessage = 'Ruta finalizada';
    });
  }

  Future<bool> _showGpsDisabledDialog() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.location_off, color: Colors.red),
              SizedBox(width: 8),
              Text('GPS Desactivado'),
            ],
          ),
          content: const Text(
            'El servicio de ubicación (GPS) está desactivado. Para poder registrar tu ruta, necesitas activarlo en la configuración de tu dispositivo.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
              ),
              child: const Text('Activar'),
            ),
          ],
        );
      },
    ) ?? false;
  }

  void _showPermissionDeniedDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.security, color: Colors.red),
              SizedBox(width: 8),
              Text('Permiso Denegado'),
            ],
          ),
          content: const Text(
            'El permiso de ubicación es indispensable para trazar tu ruta. Por favor, actívalo en los ajustes de la aplicación.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ruta GPS',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: _toggleTracking,
                      icon: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
                      label: Text(_isTracking ? 'Detener' : 'Iniciar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isTracking ? Colors.red : Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _statusMessage,
                  style: TextStyle(
                    color: _isTracking ? Colors.green : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Mapa (Canvas)
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomPaint(
                painter: RoutePainter(route: _route),
                size: Size.infinite,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Métricas
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetric(
                  icon: Icons.straighten,
                  value: '${_route.distanceKm.toStringAsFixed(2)} km',
                  label: 'Distancia',
                ),
                _buildMetric(
                  icon: Icons.timer,
                  value: _formatDuration(_route.duration),
                  label: 'Tiempo',
                ),
                _buildMetric(
                  icon: Icons.speed,
                  value: '${_route.averageSpeed.toStringAsFixed(1)} km/h',
                  label: 'Velocidad',
                ),
                _buildMetric(
                  icon: Icons.local_fire_department,
                  value: '${_route.estimatedCalories.toStringAsFixed(0)}',
                  label: 'Calorías',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF6366F1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// CustomPainter para dibujar la ruta
class RoutePainter extends CustomPainter {
  final Route route;

  RoutePainter({required this.route});

  @override
  void paint(Canvas canvas, Size size) {
    if (route.points.isEmpty) {
      final textPainter = TextPainter(
        text: const TextSpan(
          text: 'Sin datos de ruta',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2,
        ),
      );
      return;
    }

    // Calcular bounds
    double minLat = route.points.first.latitude;
    double maxLat = route.points.first.latitude;
    double minLon = route.points.first.longitude;
    double maxLon = route.points.first.longitude;

    for (final point in route.points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLon) minLon = point.longitude;
      if (point.longitude > maxLon) maxLon = point.longitude;
    }

    final padding = 20.0;
    final drawWidth = size.width - padding * 2;
    final drawHeight = size.height - padding * 2;

    Offset toPixel(LocationPoint point) {
      final latRange = maxLat - minLat;
      final lonRange = maxLon - minLon;

      final x = lonRange == 0
          ? drawWidth / 2
          : ((point.longitude - minLon) / lonRange) * drawWidth;
      final y = latRange == 0
          ? drawHeight / 2
          : ((maxLat - point.latitude) / latRange) * drawHeight;

      return Offset(x + padding, y + padding);
    }

    // Dibujar línea
    final linePaint = Paint()
      ..color = const Color(0xFF6366F1)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(toPixel(route.points.first).dx, toPixel(route.points.first).dy);

    for (int i = 1; i < route.points.length; i++) {
      final pixel = toPixel(route.points[i]);
      path.lineTo(pixel.dx, pixel.dy);
    }

    canvas.drawPath(path, linePaint);

    // Punto inicio (verde)
    final startPaint = Paint()..color = Colors.green;
    canvas.drawCircle(toPixel(route.points.first), 8, startPaint);

    // Punto final (rojo)
    final endPaint = Paint()..color = Colors.red;
    canvas.drawCircle(toPixel(route.points.last), 8, endPaint);
  }

  @override
  bool shouldRepaint(RoutePainter oldDelegate) {
    return true;
  }
}

/// Filtro de Kalman unidimensional en tiempo real para Latitud y Longitud
///
/// EXPLICACIÓN DIDÁCTICA:
/// - Reduce las oscilaciones (ruido estático de ±2-5m) del GPS al caminar en línea recta.
/// - Ajusta dinámicamente el factor de suavizado en función de la precisión (accuracy) reportada.
/// - Cuando la precisión del GPS es alta (R pequeño), confía en el nuevo punto.
/// - Cuando la precisión es baja (R grande), suaviza más la coordenada apoyándose en el histórico.
class GpsKalmanFilter {
  double? _lat;
  double? _lng;
  double _variance = -1.0;

  // Ruido de proceso estimado por segundo en grados cuadrados.
  // Equivale a ~2 metros de movimiento esperado por segundo: (2 / 111111.0)^2 ≈ 3.24e-10
  static const double _processNoise = 3.24e-10;

  LocationPoint filter(LocationPoint point) {
    if (_lat == null || _lng == null || _variance < 0) {
      _lat = point.latitude;
      _lng = point.longitude;
      _variance = (point.accuracy / 111111.0) * (point.accuracy / 111111.0);
      return point;
    }

    // Predicción del estado futuro (la incertidumbre/varianza aumenta por el ruido de proceso)
    double predictedVariance = _variance + _processNoise;

    // Convertir precisión en metros a grados cuadrados para la varianza de medición (R)
    double accuracyDegrees = point.accuracy / 111111.0;
    double r = accuracyDegrees * accuracyDegrees;

    // Calcular la Ganancia de Kalman (K)
    double k = predictedVariance / (predictedVariance + r);

    // Actualizar estimación del estado (Latitud y Longitud)
    _lat = _lat! + k * (point.latitude - _lat!);
    _lng = _lng! + k * (point.longitude - _lng!);
    _variance = (1.0 - k) * predictedVariance;

    return LocationPoint(
      latitude: _lat!,
      longitude: _lng!,
      altitude: point.altitude,
      speed: point.speed,
      accuracy: point.accuracy,
      timestamp: point.timestamp,
    );
  }
}
