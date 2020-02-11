import 'package:flutter/cupertino.dart';

import 'QuoteCategory.dart';
import 'QuoteSource.dart';

class Quote {
  final String filename;
  final String name;
  final QuoteSource source;
  final String searchStr;
  final String imageName;

  const Quote(this.filename, this.name, this.source, this.searchStr, [this.imageName]);

  bool containsSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) return true;

    final lowerCased = searchTerm.toLowerCase();

    return searchStr.toLowerCase().contains(lowerCased)
        || source.containsSearchTerm(lowerCased)
        || QuoteCategoryDesc[source.category].toLowerCase().contains(lowerCased);
  }

  AssetImage getImage() {
    if (imageName != null) {
      return new AssetImage('assets/images/$imageName.png');
    }

    if (source.imageName != null) {
      return new AssetImage('assets/images/${source.imageName}.png');
    }

    return new AssetImage('assets/images/abe.png');
  }
}