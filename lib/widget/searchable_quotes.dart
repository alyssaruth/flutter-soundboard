import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/quote.dart';

import 'quote_button.dart';

class SearchableQuotes extends StatefulWidget {
  final List<Quote> _allQuotes;

  SearchableQuotes(this._allQuotes);

  @override
  SearchableQuotesState createState() => SearchableQuotesState(_allQuotes);
}

class SearchableQuotesState extends State<SearchableQuotes> {
  final TextEditingController _filter = new TextEditingController();
  final List<Quote> _allQuotes;

  List<Quote> _filteredQuotes = [];
  bool _searching = false;

  SearchableQuotesState(this._allQuotes) {
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