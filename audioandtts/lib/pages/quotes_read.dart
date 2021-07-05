import 'package:flutter/material.dart';

class QuotesRead extends StatefulWidget {
  static const routeName = "/quotesRead";

  @override
  _QuotesReadState createState() => _QuotesReadState();
}

class _QuotesReadState extends State<QuotesRead> {
  List<String> quotes = ["one one one", "two two two two", "three three three"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read All Quotes"),
      ),
      body: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) => Container()
      ),
    );
  }
}
