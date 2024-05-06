enum QuoteCategory { SITCOM, KIDS_TV }

extension QuoteCategoryExt on QuoteCategory {
  String description() {
    switch (this) {
      case QuoteCategory.SITCOM:
        return 'Sitcom';
      case QuoteCategory.KIDS_TV:
        return 'Kids TV';
    }
  }
}
