import 'package:audioandtts/utils/textToSpeech.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class QuoteToSpeechArguments{
  final String quote;
  QuoteToSpeechArguments({required this.quote});
}

class QuoteToSpeech extends StatefulWidget {
  static const routeName = "/quoteToSpeech";
  @override
  _QuoteToSpeechState createState() => _QuoteToSpeechState();
}

class _QuoteToSpeechState extends State<QuoteToSpeech> {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PAUSED;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        playerState = state;

      });
    });
  }

  Future<void> playMusic({required String audioURL}) async {
    await audioPlayer.play(audioURL);
  }
  Future<void> pauseMusic() async {
    await audioPlayer.pause();
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
                    isPlaying = true;
                  });
                  UtilsTTS().speachTTS(
                      text: quoteToSpeechArguments.quote,
                      language: "en-US",
                  );
                },
                icon: Icon(isPlaying ? Icons.play_arrow_rounded : Icons.pause_rounded),
                label: "TTS",
              ),
              CustomBtn(
                onPressed: () {
                  playerState == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3",);
                },
                icon: Icon(playerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "Bird",
              ),
              CustomBtn(
                onPressed: () {
                  playerState == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3",);
                },
                icon: Icon(playerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "Thunder",
              ),
              CustomBtn(
                onPressed: () {
                  playerState == PlayerState.PLAYING ? pauseMusic() : playMusic(audioURL: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3",);
                },
                icon: Icon(playerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
                label: "Background",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
