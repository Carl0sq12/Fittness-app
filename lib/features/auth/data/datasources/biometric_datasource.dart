import 'package:local_auth/local_auth.dart';
import '../../domain/entities/auth_result.dart';

abstract class BiometricDataSource {
  Future<bool> canAuthenticate();
  Future<AuthResult> authenticate();
}

/// Implementación con el plugin local_auth.
/// Reemplaza completamente el MethodChannel anterior.
class BiometricDataSourceImpl implements BiometricDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Future<bool> canAuthenticate() async {
    try {
      // Verifica si el dispositivo soporta biometría Y tiene registros
      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isSupported = await _auth.isDeviceSupported();
      return canCheck && isSupported;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AuthResult> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(  //Llama al plugin
        localizedReason: 'Usa tu huella para ingresar a Fitness Tracker',
        options: const AuthenticationOptions(
          biometricOnly: false, // Permite PIN como fallback
          stickyAuth: true,     // No cancela si el usuario sale de la app
        ),
      );

      return AuthResult(
        success: didAuthenticate,
        message: didAuthenticate
            ? 'Autenticación exitosa'
            : 'Autenticación cancelada',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error de autenticación: $e',
      );
    }
  }
}