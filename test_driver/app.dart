import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:pocket_scat/util/quote.dart';
import 'package:pocket_scat/util/quote_source.dart';
import 'package:pocket_scat/widget/app.dart';

const PIECE_OF_YOUR_BRAIN = Quote("fawlty_piece_of_your_brain", "Piece of your brain", SRC_FAWLTY_TOWERS, "Is this a piece of your brain Basil");
const ERRONEOUS_DISH = Quote("fawlty_erroneous_dish", "Erroneous dish", SRC_FAWLTY_TOWERS, "I have been given an erroneous dish");
const VERY_NICE_BRIAN = Quote("bean_very_nice_brian", "Very nice Brian", SRC_BEAN, "very nice brian");
const BAD_MISS = Quote("mitchell_bad_miss_1", "Bad Miss 1", SRC_MITCHELL_AND_WEBB, "Oh and that's a bad miss");

const TEST_QUOTES = [PIECE_OF_YOUR_BRAIN, ERRONEOUS_DISH, VERY_NICE_BRIAN, BAD_MISS];

void main () {
  enableFlutterDriverExtension();

  runApp(App(TEST_QUOTES));
}