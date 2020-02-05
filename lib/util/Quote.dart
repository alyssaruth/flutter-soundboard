import 'QuoteCategory.dart';
import 'QuoteSource.dart';

class Quote {
  final String filename;
  final String name;
  final QuoteSource source;
  final String searchStr;

  const Quote(this.filename, this.name, this.source, this.searchStr);

  bool containsSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) return true;

    final lowerCased = searchTerm.toLowerCase();

    return searchStr.toLowerCase().contains(lowerCased)
        || source.containsSearchTerm(lowerCased)
        || QuoteCategoryDesc[source.category].toLowerCase().contains(lowerCased);
  }
}