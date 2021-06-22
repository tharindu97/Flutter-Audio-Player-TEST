import 'package:audioandtts/constant/audio_url.dart';
import 'package:audioandtts/models/audio.dart';
import 'package:audioandtts/services/audio.dart';
import 'package:audioandtts/utils/textToSpeech.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class QuoteToSpeechArguments{
  final String quote;
  QuoteToSpeechArguments({required this.quote});
}

enum PlayerState { stopped, playing, paused }
enum PlayerState1 { stopped1, playing1, paused1 }

class QuoteToSpeech extends StatefulWidget {
  static const routeName = "/quoteToSpeech";
  @override
  _QuoteToSpeechState createState() => _QuoteToSpeechState();
}

class _QuoteToSpeechState extends State<QuoteToSpeech> {
  bool playing = true;

  //for first audio
  late AudioPlayer audioPlayer;
  PlayerState playerState = PlayerState.stopped;
  get isPlaying => playerState == PlayerState.playing;
  //for second audio
  late AudioPlayer audioPlayer1;
  PlayerState1 playerState1 = PlayerState1.stopped1;
  get isPlaying1 => playerState1 == PlayerState1.playing1;

  @override
  void initState() {
    super.initState();
    audioPlayer =  AudioPlayer();
    audioPlayer1 =  AudioPlayer();
  }
  Future playThunder() async {
    await audioPlayer1.play(AudioURL.THUNDER_URL);
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

  Future playRain() async {
    await audioPlayer.play(AudioURL.RAIN_URL);
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



  @override
  Widget build(BuildContext context) {
    final QuoteToSpeechArguments quoteToSpeechArguments = ModalRoute.of(context)?.settings.arguments as QuoteToSpeechArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote To Speech"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              quoteToSpeechArguments.quote,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Wrap(
            spacing: 10.0,
            children: [
              CustomBtn(
                onPressed: () {
                  setState(() {
                    playing = false;
                  });
                  UtilsTTS().speachTTS(
                    text: quoteToSpeechArguments.quote,
                    language: "en-US",
                  );
                },
                icon: Icon(playing ? Icons.play_arrow_rounded : Icons.pause_rounded),
                label: "TTS",
              ),

              IconButton(
                onPressed:() =>  playerState1 == PlayerState1.playing1 ? stopThunder() : playThunder(),
                iconSize: 70.0,
                icon:Icon(playerState1 == PlayerState1.playing1 ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 55),
              ),
              IconButton(
                onPressed: () => playerState == PlayerState.playing ? stopRain() : playRain(),
                iconSize: 55.0,
                icon: Icon(playerState == PlayerState.playing ? Icons.pause_rounded : Icons.play_arrow_rounded),
              ),

              // CustomBtn(
              //   onPressed: () {
              //     playerState == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: AudioURL.BIRD_URL);
              //   },
              //   icon: Icon(playerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
              //   label: "Bird",
              // ),
              // CustomBtn(
              //   onPressed: () {
              //     playerState == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: AudioURL.THUNDER_URL,);
              //   },
              //   icon: Icon(playerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
              //   label: "Thunder",
              // ),
              // CustomBtn(
              //   onPressed: () {
              //     playerState1 == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: AudioURL.RAIN_URL,);
              //   },
              //   icon: Icon(playerState1 == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
              //   label: "Background",
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

// FutureBuilder<List<Audio>?>(
// future: AudioService.getAudios(),
// builder: (context, snapshot){
// if(snapshot.hasData){
// List<Audio>? audios = snapshot.data;
// print(audios?[0].audioName);
// return Center(
// child: Text("Connected"),
// );
// }else if(snapshot.hasError){
// return Center(
// child: Text("Error......."),
// );
// }
// return Center(
// child: Text("Loading......."),
// );
// },
// ),

