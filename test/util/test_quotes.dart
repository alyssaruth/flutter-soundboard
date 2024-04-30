import 'package:pocket_scat/util/quote.dart';
import 'package:pocket_scat/util/quote_category.dart';
import 'package:pocket_scat/util/quote_source.dart';

const QuoteSource SRC_FAWLTY_TOWERS = QuoteSource('Fawlty Towers', QuoteCategory.SITCOM, 'fawlty_towers', 'basil manuel');
const QuoteSource SRC_BEAN = QuoteSource('Mr. Bean', QuoteCategory.SITCOM, 'bean', 'mr bean');
const QuoteSource SRC_MITCHELL_AND_WEBB = QuoteSource('Mitchell and Webb', QuoteCategory.SITCOM, 'mitchell_and_webb');

const PIECE_OF_YOUR_BRAIN = Quote(
    'fawlty_piece_of_your_brain', 'Piece of your brain', SRC_FAWLTY_TOWERS, 'Is this a piece of your brain Basil', 'fawlty_towers', 'test/assets/images');
const ERRONEOUS_DISH =
Quote('fawlty_erroneous_dish', 'Erroneous dish', SRC_FAWLTY_TOWERS, 'I have been given an erroneous dish', 'fawlty_towers', 'test/assets/images');
const VERY_NICE_BRIAN = Quote('bean_very_nice_brian', 'Very nice Brian', SRC_BEAN, 'very nice brian', 'bean', 'test/assets/images');
const BAD_MISS = Quote('mitchell_bad_miss_1', 'Bad Miss 1', SRC_MITCHELL_AND_WEBB, 'Oh and thats a bad miss', 'mitchell_and_webb', 'test/assets/images');

const TEST_QUOTES = [PIECE_OF_YOUR_BRAIN, ERRONEOUS_DISH, VERY_NICE_BRIAN, BAD_MISS];