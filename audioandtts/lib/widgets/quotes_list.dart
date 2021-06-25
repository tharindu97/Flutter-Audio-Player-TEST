import 'package:audioandtts/models/quotes.dart';
import 'package:flutter/material.dart';

class QuotesList extends StatelessWidget {
  late final List<Quotes> quotes;
  QuotesList({required this.quotes});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index){
          Quotes quote = quotes[index];
          print("text");
          return Card(
            child: ListTile(
              title: Text(
                quote.firstAuthor + " " + quote.secondAuthor,
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                quote.firstQuote + quote.secondQuote,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          );
       }
    );
  }
}
