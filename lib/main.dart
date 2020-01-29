// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'util/QuoteCategory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mitchell & Webb', home: QuotesForCategory(QuoteCategory.mitchell_and_webb));
  }
}

class QuotesForCategory extends StatefulWidget {
  final QuoteCategory category;

  QuotesForCategory(this.category);

  @override
  CategoryState createState() => CategoryState(category);
}

class CategoryState extends State<QuotesForCategory> {
  final List<String> quotes = ["bad_miss_1", "bad_miss_2"];

  QuoteCategory category;

  CategoryState(this.category);

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.purple,
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: quotes.map((quote) =>
            Center(
              child: Text(
                '$quote',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline,
              ),
            )
          ).toList()
        )
      ),
    );
  }
}
