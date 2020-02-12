import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_scat/util/Quote.dart';
import 'package:pocket_scat/util/QuotesList.dart';

import 'widget/QuoteButton.dart';

void main() => runApp(PocketScat(ALL_QUOTES));

class PocketScat extends StatelessWidget {
  final List<Quote> _allQuotes;

  PocketScat(this._allQuotes);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: "Pocket Scat",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        hintColor: Colors.white70,
      ),
      home: QuoteWidget(_allQuotes));
}

class QuoteWidget extends StatefulWidget {
  final List<Quote> _allQuotes;

  QuoteWidget(this._allQuotes);

  @override
  QuoteState createState() => QuoteState(_allQuotes);
}

class QuoteState extends State<QuoteWidget> {
  final TextEditingController _filter = new TextEditingController();
  final List<Quote> _allQuotes;

  List<Quote> _filteredQuotes = [];
  bool _searching = false;

  QuoteState(this._allQuotes) {
    _filteredQuotes = _allQuotes;
    _filter.addListener(_searchChanged);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: _buildAppBar(),
        leading: new IconButton(
            icon: new Icon(_searching ? Icons.close : Icons.search),
            onPressed: _searchPressed),
      ),
      body: GridView.count(
          crossAxisCount: _computeColumnCount(context),
          childAspectRatio: 1,
          padding: const EdgeInsets.all(0),
          children: _filteredQuotes.map((q) => QuoteButton(q)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomPressed,
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.green,
      ));

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

  int _computeColumnCount(BuildContext context) =>
      MediaQuery.of(context).size.width ~/ 200;

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

  Future _randomPressed() async {
    final element = randomChoice<Quote>(_filteredQuotes);
    await element.play();
  }
}
