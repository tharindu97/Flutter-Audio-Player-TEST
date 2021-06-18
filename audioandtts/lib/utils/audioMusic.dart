import 'package:audioplayers/audioplayers.dart';

class UtilsAudioMusic{
  AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playMusic({required String audioURL}) async {
    await audioPlayer.play(audioURL);
  }
  Future<void> pauseMusic() async {
    await audioPlayer.pause();
  }
}