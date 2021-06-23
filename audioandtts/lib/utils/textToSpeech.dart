import 'package:flutter_tts/flutter_tts.dart';

class UtilsTTS{
  static final FlutterTts flutterTts = FlutterTts();

  Future<void> speachTTS({required String text, required String language}) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setSpeechRate(1);
    await flutterTts.setVolume(20);
    await flutterTts.speak(text);
  }

  Future<void> stopTTS() async{
    await flutterTts.stop();
  }
}