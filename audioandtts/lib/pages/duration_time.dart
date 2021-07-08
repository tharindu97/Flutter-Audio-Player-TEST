import 'package:audioandtts/constant/audio_url.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DurationTimeSet extends StatefulWidget {
  static const routerName = "/duration";
  @override
  _DurationTimeSetState createState() => _DurationTimeSetState();
}

enum PlayerState { stopped, playing, paused }

class _DurationTimeSetState extends State<DurationTimeSet> {

  double rainSoundVolume = 0.2;

  late AudioPlayer audioPlayer;
  PlayerState playerState = PlayerState.stopped;
  get isPlaying => playerState == PlayerState.playing;

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  /// Optional
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos); // Jumps to the given position within the audio file
  }

  /// Optional
  String getTimeString(int seconds) {
    String minuteString = '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }


  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    /// Optional
    audioPlayer.setUrl(AudioURL.RAIN_URL); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
      if(timeProgress == 10){
        print("Audio is Looping");
      }
    });
  }

  //for first audio
  Future playRain() async {
    await audioPlayer.play(AudioURL.RAIN_URL, volume: rainSoundVolume);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future stopRain() async {
    await audioPlayer.pause();
    setState(() {
      playerState = PlayerState.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Text Duration"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomBtn(
              onPressed: () => playerState == PlayerState.playing ? stopRain() : playRain(),
              icon: Icon(playerState == PlayerState.playing ? Icons.pause_rounded : Icons.play_arrow_rounded),
              label: "Rain",
            ),
            Slider(
              value: rainSoundVolume,
              min: 0,
              max: 1,
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,
              onChanged: (value){
                setState(() {
                  rainSoundVolume = value;
                  audioPlayer.setVolume(value);
                });
              },
              divisions: 10,
              label: "$rainSoundVolume",
            ),
            Text(getTimeString(timeProgress)),
            Text(getTimeString(audioDuration))
          ],
        ),
      ),
    );
  }
}
