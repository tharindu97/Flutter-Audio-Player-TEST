import 'package:audioandtts/config.dart';
import 'package:audioandtts/models/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AudioService{
  static Future<Audio?> getAudio() async {
    CollectionReference response = Config.db.collection("audio");
    DocumentSnapshot snapshot = await response.doc("TlcomwJ3FJiXwjr3t7xX").get();
    var data = snapshot.data() as Map<String, dynamic>;
    return Audio.fromJson(data);
  }
}