import 'QuoteCategory.dart';

class QuoteSource {
  String name;
  QuoteCategory category;
  String searchTerms;

  QuoteSource(this.name, this.category, [this.searchTerms]);

  bool containsSearchTerm(String searchTerm) {
    return name.toLowerCase().contains(searchTerm)
        || (searchTerms != null && searchTerms.toLowerCase().contains(searchTerm));
  }
}

final QuoteSource SRC_MITCHELL_AND_WEBB = QuoteSource("Mitchell and Webb", QuoteCategory.SKETCH);
final QuoteSource SRC_NTNON = QuoteSource("Not the Nine O'Clock News", QuoteCategory.SKETCH);
final QuoteSource SRC_ROWAN_ATKINSON = QuoteSource("Rowan Atkinson", QuoteCategory.SKETCH);

final QuoteSource SRC_FAWLTY_TOWERS = QuoteSource("Fawlty Towers", QuoteCategory.SITCOM, "basil manuel");
final QuoteSource SRC_BEAN = QuoteSource("Mr. Bean", QuoteCategory.SITCOM);
final QuoteSource SRC_CYE = QuoteSource("Curb Your Enthusiasm", QuoteCategory.SITCOM, "larry david");
final QuoteSource SRC_FRIENDS = QuoteSource("Friends", QuoteCategory.SITCOM);
final QuoteSource SRC_HYACINTH = QuoteSource("Keeping Up Appearances", QuoteCategory.SITCOM, "hyacinth richard bucket");
final QuoteSource SRC_PARTRIDGE = QuoteSource("Alan Partridge", QuoteCategory.SITCOM);
final QuoteSource SRC_RED_DWARF = QuoteSource("Red Dwarf", QuoteCategory.SITCOM);
final QuoteSource SRC_VM = QuoteSource("One Foot in the Grave", QuoteCategory.SITCOM, "victor meldrew");

final QuoteSource SRC_ABE = QuoteSource("Abe's Oddyssee", QuoteCategory.GAME, "oddworld");
final QuoteSource SRC_TOMB_RAIDER = QuoteSource("Tomb Raider", QuoteCategory.GAME);

final QuoteSource SRC_APPRENTICE = QuoteSource("The Apprentice", QuoteCategory.MISC, "alan sugar");
final QuoteSource SRC_THE_CHASE = QuoteSource("The Chase", QuoteCategory.MISC);
final QuoteSource SRC_JOHNNY_ENGLISH = QuoteSource("Johnny English", QuoteCategory.MISC, "jonny");
final QuoteSource SRC_RAT_RACE = QuoteSource("Rat Race", QuoteCategory.MISC);
final QuoteSource SRC_TUFFERS = QuoteSource("Tuffers", QuoteCategory.MISC, "phil tuffnell");
final QuoteSource SRC_TWININGS = QuoteSource("Twinings", QuoteCategory.MISC);

final QuoteSource SRC_ART_ATTACK = QuoteSource("Art Attack", QuoteCategory.KIDS_TV);
final QuoteSource SRC_BLOBBY = QuoteSource("Mr. Blobby", QuoteCategory.KIDS_TV, "noel edmonds");
final QuoteSource SRC_CLANGERS = QuoteSource("The Clangers", QuoteCategory.KIDS_TV);
final QuoteSource SRC_PLAYDAYS = QuoteSource("Playdays", QuoteCategory.KIDS_TV, "poppy");
final QuoteSource SRC_RIVERBANK = QuoteSource("Tales of the Riverbank", QuoteCategory.KIDS_TV);
final QuoteSource SRC_SOOTY = QuoteSource("Sooty", QuoteCategory.KIDS_TV, "sweep soo");
final QuoteSource SRC_TOTS_TV = QuoteSource("Tots TV", QuoteCategory.KIDS_TV);
final QuoteSource SRC_WALLACE_AND_GROMIT = QuoteSource("Wallace and Gromit", QuoteCategory.KIDS_TV);
