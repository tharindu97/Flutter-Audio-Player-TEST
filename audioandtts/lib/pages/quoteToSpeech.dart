import 'package:audioandtts/constant/audio_url.dart';
import 'package:audioandtts/utils/textToSpeech.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuoteToSpeechArguments{
  final String quote;
  QuoteToSpeechArguments({required this.quote});
}

enum PlayerState { stopped, playing, paused }
enum PlayerState1 { stopped1, playing1, paused1 }
enum PlayerState2 { stopped2, playing2, paused2 }
enum TtsState { playing, stopped }

class QuoteToSpeech extends StatefulWidget {
  static const routeName = "/quoteToSpeech";
  @override
  _QuoteToSpeechState createState() => _QuoteToSpeechState();
}

class _QuoteToSpeechState extends State<QuoteToSpeech> {
  double soundValue = 0.2;
  double birdSoundVolume = 0.2;
  double rainSoundVolume = 0.2;
  double thunderSoundVolume = 0.2;
  final String text =
      "The Sigiriya Rock is actually a hardened magma plug from an extinct volcano. The most significant feature of the rock would be the Lion staircase leading to the palace garden. The Lion could be visualized as a huge figure towering against the granite cliff. The opened mouth of the Lion leads to the staircase built of bricks and timber. However the only remains of this majestic structure are the two paws and the masonry walls surrounding it. Nevertheless the cuts and groves in the rock face give an impression of a lion figure. There are only two pockets of paintings covering most of the western face of the rock. The ladies depicted in the paintings have been identified as Apsaras. However a lot of these ladies have been wiped out when the palace was again converted into a monastery so as to not to disturb meditation.";

  TtsState ttsState = TtsState.stopped;
  get isPlayingTTS => ttsState == TtsState.playing;
  get isStoppedTTS => ttsState == TtsState.stopped;
  //for first audio
  late AudioPlayer audioPlayer;
  PlayerState playerState = PlayerState.stopped;
  get isPlaying => playerState == PlayerState.playing;

  //for second audio
  late AudioPlayer audioPlayer1;
  PlayerState1 playerState1 = PlayerState1.stopped1;
  get isPlaying1 => playerState1 == PlayerState1.playing1;

  //for third audio
  late AudioPlayer audioPlayer2;
  PlayerState2 playerState2 = PlayerState2.stopped2;
  get isPlaying2 => playerState2 == PlayerState2.playing2;

  @override
  void initState() {
    super.initState();
    audioPlayer =  AudioPlayer();
    audioPlayer1 =  AudioPlayer();
    audioPlayer2 = AudioPlayer();
    UtilsTTS.flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
        print("Complete");
      });
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
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
    });
  }

  //for second audio
  Future playThunder() async {
    await audioPlayer1.play(AudioURL.THUNDER_URL, volume: thunderSoundVolume);
    setState(() {
      playerState1 = PlayerState1.playing1;
    });
  }
  Future stopThunder() async {
    await audioPlayer1.stop();
    setState(() {
      playerState1 = PlayerState1.stopped1;
    });
  }

  //for third audio
  Future playBird() async {
    await audioPlayer2.play(AudioURL.BIRD_URL, volume: birdSoundVolume);
    setState(() {
      playerState2 = PlayerState2.playing2;
    });
  }
  Future stopBird() async {
    await audioPlayer2.stop();
    setState(() {
      playerState2 = PlayerState2.stopped2;
    });
  }



  @override
  Widget build(BuildContext context) {
    final QuoteToSpeechArguments quoteToSpeechArguments = ModalRoute.of(context)?.settings.arguments as QuoteToSpeechArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote To Speech"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Column(
            children: [
              CustomBtn(
                onPressed: () {
                  setState(() {
                    ttsState == TtsState.stopped ? ttsState = TtsState.playing : ttsState = TtsState.stopped;
                  });
                  ttsState == TtsState.playing ? UtilsTTS().speachTTS(text: text, language: "en-US", soundValue: soundValue) : UtilsTTS().stopTTS();
                },
                icon: Icon(ttsState == TtsState.playing ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "TTS",
              ),
              Slider(
                value: soundValue,
                min: 0,
                max: 1,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade100,
                onChanged: (value){
                  setState(() {
                    soundValue = value;
                    UtilsTTS.flutterTts.setVolume(value);
                  });
                },
                divisions: 10,
                label: "$soundValue",
              ),
              CustomBtn(
                onPressed: () => playerState2 == PlayerState2.playing2 ? stopBird() : playBird(),
                icon: Icon(playerState2 == PlayerState2.playing2 ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "Bird",
              ),
              Slider(
                value: birdSoundVolume,
                min: 0,
                max: 1,
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.shade100,
                onChanged: (value){
                  setState(() {
                    birdSoundVolume = value;
                    audioPlayer2.setVolume(value);
                  });
                },
                divisions: 10,
                label: "$birdSoundVolume",
              ),
              CustomBtn(
                onPressed: () => playerState1 == PlayerState1.playing1 ? stopThunder() : playThunder(),
                icon: Icon(playerState1 == PlayerState1.playing1 ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "Thunder",
              ),
              Slider(
                value: thunderSoundVolume,
                min: 0,
                max: 1,
                activeColor: Colors.pink,
                inactiveColor: Colors.pink.shade100,
                onChanged: (value){
                  setState(() {
                    thunderSoundVolume = value;
                    audioPlayer1.setVolume(value);
                  });
                },
                divisions: 10,
                label: "$thunderSoundVolume",
              ),
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
            ],
          ),
        ],
      ),
    );
  }
}

