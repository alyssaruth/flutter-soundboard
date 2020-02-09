import 'package:flutter/material.dart';

enum QuoteCategory {
  SKETCH,
  SITCOM,
  GAME,
  KIDS_TV,
  MISC
}

const Map<QuoteCategory, String> QuoteCategoryDesc = {
  QuoteCategory.SKETCH: "Sketches",
  QuoteCategory.SITCOM: "Sitcom",
  QuoteCategory.GAME: "Games",
  QuoteCategory.KIDS_TV: "Kids TV",
  QuoteCategory.MISC: "Misc",
};

const Map<QuoteCategory, ColorSwatch> hmCategoryToColor = {
  QuoteCategory.SKETCH: Colors.orangeAccent,
  QuoteCategory.SITCOM: Colors.redAccent,
  QuoteCategory.GAME: Colors.blueAccent,
  QuoteCategory.KIDS_TV: Colors.teal,
  QuoteCategory.MISC: Colors.purpleAccent,
};