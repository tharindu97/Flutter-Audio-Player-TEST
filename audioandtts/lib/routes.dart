import 'package:audioandtts/pages/all_quotes_page.dart';
import 'package:audioandtts/pages/duration_time.dart';
import 'package:audioandtts/pages/home.dart';
import 'package:audioandtts/pages/quoteToSpeech.dart';
import 'package:audioandtts/pages/quotes_read.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routerName: (_) => HomePage(),
  QuoteToSpeech.routeName: (_) => QuoteToSpeech(),
  AllQuotes.routerName: (_) => AllQuotes(),
  QuotesRead.routeName: (_) => QuotesRead(),
  DurationTimeSet.routerName: (_) => DurationTimeSet(),
};