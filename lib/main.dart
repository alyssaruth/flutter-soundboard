// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/QuotesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mitchell & Webb',
        home: QuotesWidget());
  }
}

class QuotesWidget extends StatefulWidget {

  @override
  QuoteState createState() => QuoteState();
}

class QuoteState extends State<QuotesWidget> {
  AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pocket Scat",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Pocket Scat"),
            backgroundColor: Colors.purple,
          ),
          body: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: quotes
                  .map((quote) => Center(
                        child: ListTile(
                            title: Text(
                              '${quote.name}',
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: () {
                              playQuote(quote.filename);
                            }),
                      ))
                  .toList())),
    );
  }

  Future playQuote(String filename) async {
    await player?.pause();
    player = await AudioCache().play("$filename.wav");
  }
}
