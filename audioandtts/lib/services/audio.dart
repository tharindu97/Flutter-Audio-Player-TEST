import 'dart:convert';
import 'package:audioandtts/config.dart';
import 'package:audioandtts/models/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AudioService{
  static Future<List<Audio>?> getAudios() async {
    CollectionReference response = Config.db.collection("audio");
    QuerySnapshot snapshot = await response.get();
    snapshot.docs.map<Audio?>((element){
      var data = element.data() as Map<String, dynamic>;
      return Audio.fromJson(data);
    }).toList();
  }
}