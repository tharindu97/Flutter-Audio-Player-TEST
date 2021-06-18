import 'package:audioandtts/config.dart';
import 'package:audioandtts/models/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteService {
  static Future<Quote?> getQuote() async {
    CollectionReference response =  Config.db.collection("published_quotes");
    DocumentSnapshot snapshot = await response.doc("EZanZFt6nzAVgA2qqAHP").get();
    var data = snapshot.data() as Map<String, dynamic>;
    return Quote.fromJson(data);
  }
}