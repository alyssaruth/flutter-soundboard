import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/Quote.dart';
import 'package:pocket_scat/util/QuotesList.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

import 'util/QuoteCategory.dart';

void main() => runApp(PocketScat(ALL_QUOTES));

class PocketScat extends StatefulWidget {
  final List<Quote> _allQuotes;

  PocketScat(this._allQuotes);

  @override
  QuoteState createState() => QuoteState(_allQuotes);
}

class QuoteState extends State<PocketScat> {
  final TextEditingController _filter = new TextEditingController();
  final List<Quote> _allQuotes;

  AudioPlayer _audioPlayer;
  String _searchText = "";
  List<Quote> _filteredQuotes = [];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Pocket Scat');

  QuoteState(this._allQuotes) {
    _filteredQuotes = _allQuotes;

    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
        _filteredQuotes =
            _allQuotes.where((q) => q.containsSearchTerm(_searchText)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pocket Scat",
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        hintColor: Colors.white70,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: _appBarTitle,
            leading:
                new IconButton(icon: _searchIcon, onPressed: _searchPressed),
          ),
          body: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(0),
              children: _filteredQuotes.map(_getQuoteButton).toList()),
          floatingActionButton: FloatingActionButton(
            onPressed: _randomPressed,
            child: Icon(Icons.play_arrow),
            backgroundColor: Colors.green,
          )),
    );
  }

  CupertinoButton _getQuoteButton(Quote quote) => CupertinoButton(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: hmCategoryToColor[quote.source.category],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Text(
              quote.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        onPressed: () {
          _playQuote(quote.filename);
        },
      );

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            hintText: 'Search...',
          ),
          autofocus: true,
          style: TextStyle(color: Colors.white)
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Pocket Scat');
        _searchText = "";
        _filter.clear();
        _filteredQuotes = _allQuotes;
      }
    });
  }

  Future _randomPressed() async {
    final element = randomChoice<Quote>(_filteredQuotes);
    await _playQuote(element.filename);
  }

  Future _playQuote(String filename) async {
    await _audioPlayer?.stop();
    _audioPlayer = await AudioCache().play("$filename.wav");
  }
}
