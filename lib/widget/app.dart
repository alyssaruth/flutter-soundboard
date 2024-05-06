import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/globals.dart';
import 'package:pocket_scat/util/quote.dart';

import 'searchable_quotes.dart';

class App extends StatelessWidget {
  final List<Quote> _allQuotes;

  const App(this._allQuotes);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple, hintColor: Colors.white70);

    return MaterialApp(
        title: 'Soundboard',
        theme: theme.copyWith(colorScheme: theme.colorScheme.copyWith(secondary: Colors.purpleAccent)),
        home: SearchableQuotes(_allQuotes));
  }

  PlayerState getAudioPlayerState() => getPlaybackState();
  Quote? getQuoteCurrentlyBeingShared() => quoteBeingShared;
}
