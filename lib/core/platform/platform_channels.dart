/// Constantes para los nombres de Platform Channels
/// Centralizar nombres evita errores de tipeo
//class PlatformChannels {
  // Prevenir instanciación
 // PlatformChannels._();

  //static const String biometric = 'com.tuinstituto.fitness/biometric';
  //static const String accelerometer = 'com.tuinstituto.fitness/accelerometer';
  //static const String gps = 'com.tuinstituto.fitness/gps';
//}

/// Archivo conservado por referencia histórica.
/// Los Platform Channels han sido reemplazados por plugins:
/// - local_auth       → autenticación biométrica
/// - geolocator       → GPS y ubicación
/// - sensors_plus     → acelerómetro
class PlatformChannels {
  PlatformChannels._();

  // Ya no se usan activamente; eliminados biometric, accelerometer, gps.
  // Si en el futuro se necesita un canal nativo personalizado, definirlo aquí.
}
