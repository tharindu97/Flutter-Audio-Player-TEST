import 'package:cloud_firestore/cloud_firestore.dart';

class Quotes{
  late final String firstAuthor;
  late final String secondAuthor;
  late final String quoteCategory;
  late final String firstQuote;
  late final String secondQuote;
  late final String quoteImageURL;
  late final String authorImageURL;

  Quotes({
    required this.firstAuthor,
    required this.secondAuthor,
    required this.quoteCategory,
    required this.firstQuote,
    required this.secondQuote,
    required this.quoteImageURL,
    required this.authorImageURL,
  });

  factory Quotes.fromJson(QueryDocumentSnapshot data) {
    return Quotes(
        firstAuthor: data["author_f_name"],
        secondAuthor: data["author_l_name"],
        quoteCategory: data["quote_category"],
        firstQuote: data["quote_text_1"],
        secondQuote: data["quote_text_2"],
        quoteImageURL: data["quote_image_url"],
        authorImageURL: data["author_image_url"]
    );
  }
}