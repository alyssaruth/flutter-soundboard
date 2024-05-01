import 'quote_category.dart';

class QuoteSource {
  final String _name;
  final QuoteCategory _category;
  final String imageName;
  final String _searchTerms;

  const QuoteSource(this._name, this._category, this.imageName, [this._searchTerms = '']);

  bool containsSearchTerm(String searchTerm) {
    final lowerCased = searchTerm.toLowerCase();
    return _name.toLowerCase().contains(lowerCased) ||
        (_searchTerms.toLowerCase().contains(lowerCased)) ||
        _category.description().toLowerCase().contains(lowerCased);
  }
}

const QuoteSource SRC_BEAN = QuoteSource('Mr. Bean', QuoteCategory.SITCOM, 'bean', 'mr bean');
const QuoteSource SRC_PARTRIDGE = QuoteSource('Alan Partridge', QuoteCategory.SITCOM, 'partridge');
const QuoteSource SRC_SOOTY = QuoteSource('Sooty', QuoteCategory.KIDS_TV, 'sooty', 'sweep soo matthew corbert');
