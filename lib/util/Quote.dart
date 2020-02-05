import 'QuoteCategory.dart';
import 'QuoteSource.dart';

class Quote {
  String filename;
  String name;
  QuoteSource source;
  String searchStr;

  Quote(this.filename, this.name, this.source, this.searchStr);

  bool containsSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) return true;

    final lowerCased = searchTerm.toLowerCase();

    return searchStr.toLowerCase().contains(lowerCased)
        || source.containsSearchTerm(lowerCased)
        || QuoteCategoryDesc[source.category].toLowerCase().contains(lowerCased);
  }
}