import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';

void main() {
  test('specified audio file should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final expectedPath = 'assets/${quote.filename}.wav';
      final exists = new File(expectedPath).existsSync();
      if (!exists) printOnFailure(expectedPath);

      expect(exists, true);
    });
  });

  test('specified image should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final img = quote.getImage();
      final exists = new File(img.keyName).existsSync();
      if (!exists) printOnFailure(img.keyName);

      expect(exists, true);
    });
  });
}