import 'quote_category.dart';

class QuoteSource {
  final String _name;
  final QuoteCategory _category;
  final String imageName;
  final String _searchTerms;

  const QuoteSource(this._name, this._category, this.imageName, [this._searchTerms]);

  bool containsSearchTerm(String searchTerm) {
    final lowerCased = searchTerm.toLowerCase();
    return _name.toLowerCase().contains(lowerCased) ||
        (_searchTerms != null && _searchTerms.toLowerCase().contains(lowerCased)) ||
        QuoteCategoryDesc[_category].toLowerCase().contains(lowerCased);
  }
}

const QuoteSource SRC_MITCHELL_AND_WEBB = QuoteSource('Mitchell and Webb', QuoteCategory.SKETCH, 'mitchell_and_webb');
const QuoteSource SRC_NTNON = QuoteSource('Not the Nine O\'Clock News', QuoteCategory.SKETCH, 'ntnon');
const QuoteSource SRC_ROWAN_ATKINSON = QuoteSource('Rowan Atkinson', QuoteCategory.SKETCH, 'rowan_atkinson');
const QuoteSource SRC_MONTY_PYTHON = QuoteSource('Monty Python', QuoteCategory.SKETCH, 'monty_python');

const QuoteSource SRC_HUSTLE = QuoteSource('Hustle', QuoteCategory.SITCOM, 'hustle', 'hustle');
const QuoteSource SRC_FAWLTY_TOWERS =
    QuoteSource('Fawlty Towers', QuoteCategory.SITCOM, 'fawlty_towers', 'basil manuel');
const QuoteSource SRC_BEAN = QuoteSource('Mr. Bean', QuoteCategory.SITCOM, 'bean', 'mr bean');
const QuoteSource SRC_FRIENDS = QuoteSource('Friends', QuoteCategory.SITCOM, 'friends');
const QuoteSource SRC_HYACINTH =
    QuoteSource('Keeping Up Appearances', QuoteCategory.SITCOM, 'hyacinth', 'hyacinth richard bucket');
const QuoteSource SRC_DADS_ARMY = QuoteSource('Dad\'s Army', QuoteCategory.SITCOM, 'dads_army', 'dads army');
const QuoteSource SRC_B99 = QuoteSource('Brooklyn 99', QuoteCategory.SITCOM, 'holt', 'raymond ray holt v2');

const QuoteSource SRC_BRUCE = QuoteSource('Bruce Forsyth', QuoteCategory.MISC, 'bruce');
const QuoteSource SRC_THE_CHASE = QuoteSource('The Chase', QuoteCategory.MISC, 'the_chase');
const QuoteSource SRC_JOHNNY_ENGLISH = QuoteSource('Johnny English', QuoteCategory.MISC, 'johnny_english', 'jonny');
const QuoteSource SRC_RAT_RACE = QuoteSource('Rat Race', QuoteCategory.MISC, 'rat_race');
const QuoteSource SRC_BARGAIN_HUNT = QuoteSource('Bargain Hunt', QuoteCategory.MISC, 'bargain_hunt', 'tim wonnacott');
const QuoteSource SRC_ICE_AGE = QuoteSource('Ice Age', QuoteCategory.MISC, 'ice_age', 'sid');

const QuoteSource SRC_ART_ATTACK = QuoteSource('Art Attack', QuoteCategory.KIDS_TV, 'art_attack');
const QuoteSource SRC_WALLACE_AND_GROMIT =
    QuoteSource('Wallace and Gromit', QuoteCategory.KIDS_TV, 'wallace_and_gromit');
