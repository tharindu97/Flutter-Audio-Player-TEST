import 'package:audioandtts/models/quote.dart';
import 'package:audioandtts/services/quote.dart';
import 'package:flutter/cupertino.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Text(
                quote?.author ?? '',
                style: TextStyle(fontSize: 25.0),
              ),
            ],
          );
      },
      ),
    );
  }
}
