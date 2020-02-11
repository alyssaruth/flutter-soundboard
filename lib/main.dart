import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/Quote.dart';
import 'package:pocket_scat/util/QuotesList.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

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
  List<Quote> _filteredQuotes = [];
  bool _searching = false;

  QuoteState(this._allQuotes) {
    _filteredQuotes = _allQuotes;

    _filter.addListener(_searchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pocket Scat",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        hintColor: Colors.white70,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: _buildAppBar(),
            leading: new IconButton(
                icon: new Icon(_searching ? Icons.close : Icons.search),
                onPressed: _searchPressed),
          ),
          body: GridView.count(
              crossAxisCount: 2,
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
            image: new DecorationImage(image: quote.getImage()),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.75),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 8),
                child: Text(
                  quote.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ),
        onPressed: () {
          _playQuote(quote.filename);
        },
      );

  void _searchChanged() {
    setState(() {
      _filteredQuotes =
          _allQuotes.where((q) => q.containsSearchTerm(_filter.text)).toList();
    });
  }

  void _searchPressed() {
    setState(() {
      _searching = !_searching;
      if (!_searching) {
        _filter.clear();
        _filteredQuotes = _allQuotes;
      }
    });
  }

  Widget _buildAppBar() {
    if (_searching) {
      return new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            hintText: 'Search...',
            suffixText: '${_filteredQuotes.length}',
          ),
          autofocus: true,
          style: TextStyle(color: Colors.white));
    } else {
      return new Text('Pocket Scat');
    }
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
