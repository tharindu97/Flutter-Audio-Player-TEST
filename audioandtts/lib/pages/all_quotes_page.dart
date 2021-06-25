import 'package:audioandtts/models/quotes.dart';
import 'package:audioandtts/services/quotes.dart';
import 'package:audioandtts/widgets/quotes_list.dart';
import 'package:flutter/material.dart';

class AllQuotes extends StatefulWidget {
  static const routerName = "/quotes";
  @override
  _AllQuotesState createState() => _AllQuotesState();
}

class _AllQuotesState extends State<AllQuotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Quotes"),
      ),
      body: FutureBuilder<List<Quotes>?>(
      future: QuotesService.getQuotes(),
      builder: (context, snapshot){
      if(snapshot.hasData){
        List<Quotes>? quotes = snapshot.data;
        return quotes != null ? QuotesList(quotes: quotes,) : Center(
          child: Text("Nothing to show quotes!.."),
        );
      }else if(snapshot.hasError){
        return Center(
          child: Text("Error......."),
        );
      }
        return Center(
          child: Text("Loading......."),
        );
      },
      ),
    );

  }
}
