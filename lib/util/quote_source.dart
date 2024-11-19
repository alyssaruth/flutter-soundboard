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

const QuoteSource SRC_HUSTLE = QuoteSource('Hustle', QuoteCategory.TV, 'hustle', 'hustle');
const QuoteSource SRC_DEXTER = QuoteSource('Dexter', QuoteCategory.TV, 'doakes', 'dexter lundy doakes');
const QuoteSource SRC_FRIENDS = QuoteSource('Friends', QuoteCategory.TV, 'friends');
const QuoteSource SRC_HYACINTH =
    QuoteSource('Keeping Up Appearances', QuoteCategory.TV, 'hyacinth', 'hyacinth richard bucket');
const QuoteSource SRC_DADS_ARMY = QuoteSource('Dad\'s Army', QuoteCategory.TV, 'dads_army', 'dads army');
const QuoteSource SRC_DOCTOR_WHO = QuoteSource('Doctor Who', QuoteCategory.TV, 'doctor_who', 'david tennant');
const QuoteSource SRC_B99 = QuoteSource('Brooklyn 99', QuoteCategory.TV, 'holt', 'raymond ray holt');
const QuoteSource SRC_GHOSTS = QuoteSource('Ghosts', QuoteCategory.TV, 'ghosts_julian');
const QuoteSource SRC_MANDALORIAN = QuoteSource('The Mandalorian', QuoteCategory.TV, 'mandalorian');
const QuoteSource SRC_TASKMASTER = QuoteSource('Taskmaster', QuoteCategory.TV, 'taskmaster');
const QuoteSource SRC_SOME_MOTHERS = QuoteSource('Some mothers do ave em', QuoteCategory.TV, 'frank');
const QuoteSource SRC_QI = QuoteSource('QI', QuoteCategory.TV, 'qi');

const QuoteSource SRC_BARGAIN_HUNT = QuoteSource('Bargain Hunt', QuoteCategory.MISC, 'bargain_hunt', 'tim wonnacott');
const QuoteSource SRC_CABIN_PRESSURE =
    QuoteSource('Cabin Pressure', QuoteCategory.MISC, 'cabin_pressure', 'cabin pressure');
const QuoteSource SRC_DEAL_OR_NO_DEAL =
    QuoteSource('Deal or no Deal', QuoteCategory.MISC, 'deal_or_no_deal', 'noel edmonds');
const QuoteSource SRC_ICE_AGE = QuoteSource('Ice Age', QuoteCategory.MISC, 'ice_age', 'sid');
const QuoteSource SRC_NO_MORE_JOCKEYS =
    QuoteSource('No More Jockeys', QuoteCategory.MISC, 'nmj_horne', 'alex horne tim key mark watson watto');
const QuoteSource SRC_NTNON = QuoteSource('Not the Nine O\'Clock News', QuoteCategory.MISC, 'ntnon');
const QuoteSource SRC_NEWS = QuoteSource('News', QuoteCategory.MISC, 'election');
const QuoteSource SRC_HARRY_POTTER = QuoteSource('Harry Potter', QuoteCategory.MISC, 'hp_harry');
const QuoteSource SRC_LIZZIE_MCGUIRE = QuoteSource('Lizzie McGuire', QuoteCategory.MISC, 'lizzie_mcguire');
const QuoteSource SRC_PETER_PAN = QuoteSource('Peter pan goes wrong', QuoteCategory.MISC, 'peter_pan');
const QuoteSource SRC_STAR_WARS = QuoteSource('Star Wars', QuoteCategory.MISC, 'star_wars');

const QuoteSource SRC_ANASTASIA = QuoteSource('Anastasia', QuoteCategory.KIDS_TV, 'anastasia');
const QuoteSource SRC_NOAHS_ISLAND = QuoteSource('Noahs Island', QuoteCategory.KIDS_TV, 'sasha');
const QuoteSource SRC_ART_ATTACK = QuoteSource('Art Attack', QuoteCategory.KIDS_TV, 'art_attack');
const QuoteSource SRC_WALLACE_AND_GROMIT =
    QuoteSource('Wallace and Gromit', QuoteCategory.KIDS_TV, 'wallace_and_gromit');
