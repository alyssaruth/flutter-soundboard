enum QuoteCategory { SKETCH, TV, KIDS_TV, MISC }

extension QuoteCategoryExt on QuoteCategory {
  String description() {
    switch (this) {
      case QuoteCategory.SKETCH:
        return 'Sketches';
      case QuoteCategory.TV:
        return 'TV';
      case QuoteCategory.KIDS_TV:
        return 'Kids TV';
      case QuoteCategory.MISC:
        return 'Misc';
    }
  }
