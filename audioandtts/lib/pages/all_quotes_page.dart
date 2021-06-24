import 'package:flutter/material.dart';

class AllQuotes extends StatefulWidget {
  static const routerName = "/quotes";
  @override
  _AllQuotesState createState() => _AllQuotesState();
}

class _AllQuotesState extends State<AllQuotes> {
  double rating = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
              value: rating,
              min: 0,
              max: 100,
              activeColor: Colors.red,
              inactiveColor: Colors.red.shade100,
              onChanged: (value){
                setState(() {
                  rating = value;
                });
              },
              divisions: 10,
              label: "$rating",
          ),
        ],
      ),
    );
  }
}
