import 'package:cloud_firestore/cloud_firestore.dart';

class Audio{
  late final String audioName;
  late final String audioURL;

  Audio({required this.audioName, required this.audioURL});

  factory Audio.fromJson(QueryDocumentSnapshot data) {
    return Audio(
        audioName: data["audio-name"],
        audioURL: data["audio-url"],
    );
  }
}