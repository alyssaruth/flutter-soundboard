import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/Quote.dart';

import 'SearchableQuotes.dart';

class App extends StatelessWidget {
  final List<Quote> _allQuotes;

  App(this._allQuotes);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: "Pocket Scat",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        hintColor: Colors.white70,
      ),
      home: SearchableQuotes(_allQuotes));
}