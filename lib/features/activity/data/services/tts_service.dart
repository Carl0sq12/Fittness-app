import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  /// Inicializa el motor TTS una sola vez.
  /// Llamadas repetidas son ignoradas para evitar reinicializaciones
  /// que silencian el audio en Android.
  Future<void> init() async {
    if (_initialized) return;
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    // No bloquear el hilo mientras habla (importante en Android)
    await _tts.awaitSpeakCompletion(false);
    _initialized = true;
  }

  /// Reproduce el texto en voz alta.
  /// NO se llama stop() antes de speak() porque en Android eso silencia
  /// el motor TTS antes de que pueda emitir audio.
  Future<void> speak(String text) async {
    if (text.isEmpty) return;
    await _tts.speak(text);
  }

  void dispose() {
    _tts.stop();
  }
}