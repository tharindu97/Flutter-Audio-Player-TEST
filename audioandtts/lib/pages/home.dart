import 'package:audioandtts/models/quote.dart';
import 'package:audioandtts/pages/quoteToSpeech.dart';
import 'package:audioandtts/services/quote.dart';
import 'package:audioandtts/widgets/customBtn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routerName = "/home";
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  quote?.quote ?? '',
                  style: TextStyle(fontSize: 25.0),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomBtn(
                  onPressed: () => Navigator.of(context).pushNamed(QuoteToSpeech.routeName, arguments: QuoteToSpeechArguments(quote: quote!.quote),),
                  icon: Icon(Icons.play_arrow_rounded),
                  label: "Next",
              ),
            ],
          );
        },
      ),
    );
  }
}
