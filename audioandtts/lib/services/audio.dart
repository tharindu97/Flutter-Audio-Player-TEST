import 'package:audioandtts/config.dart';
import 'package:audioandtts/models/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AudioService{
  static Future<List<Audio>?> getAudios() async {
    CollectionReference response = Config.db.collection("audio");
    QuerySnapshot<Object?> snapshot = await response.get();
    return snapshot.docs.map<Audio>((data) {
      return Audio.fromJson(data);
    }).toList();
  }
}