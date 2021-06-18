import 'package:audioandtts/pages/home.dart';
import 'package:audioandtts/pages/quoteToSpeech.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routerName: (_) => HomePage(),
  QuoteToSpeech.routeName: (_) => QuoteToSpeech(),
};