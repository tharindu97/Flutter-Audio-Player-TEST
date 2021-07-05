import 'package:audioandtts/models/quote.dart';
import 'package:audioandtts/pages/all_quotes_page.dart';
import 'package:audioandtts/pages/quoteToSpeech.dart';
import 'package:audioandtts/pages/quotes_read.dart';
import 'package:audioandtts/services/quote.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routerName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote Details"),
      ),
      body: FutureBuilder<Quote?>(
        future: QuoteService.getQuote(),
        builder: (BuildContext context, AsyncSnapshot<Quote?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          Quote? quote = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              CustomBtn(
                  onPressed: () => Navigator.of(context).pushNamed(QuoteToSpeech.routeName, arguments: QuoteToSpeechArguments(quote: quote!.quote),),
                  icon: Icon(Icons.label),
                  label: "Test TTS",
              ),
              SizedBox(height: 20.0,),
              CustomBtn(
                onPressed: () => Navigator.of(context).pushNamed(AllQuotes.routerName),
                icon: Icon(Icons.label),
                label: "All Quotes",
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomBtn(
                  onPressed: () => Navigator.of(context).pushNamed(QuotesRead.routeName),
                  icon: Icon(Icons.ac_unit),
                  label: "Quotes Read"
              ),
            ],
          );
        },
      ),
    );
  }
}
