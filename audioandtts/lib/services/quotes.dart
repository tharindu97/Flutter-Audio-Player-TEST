import 'package:audioandtts/config.dart';
import 'package:audioandtts/models/quotes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuotesService{
  static Future<List<Quotes>?> getQuotes() async{
    CollectionReference response = Config.db.collection("published_quotes");
    QuerySnapshot<Object?> snapshot = await response.get();
    return snapshot.docs.map<Quotes>((data){
      return Quotes.fromJson(data);
    }).toList();
  }
}