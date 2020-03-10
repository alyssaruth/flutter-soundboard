import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';

void main() {
  test('specified audio file should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final expectedPath = 'assets/${quote.filename}.wav';
      final exists = _getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    });
  });

  test('specified image should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final expectedPath = quote.getImage().keyName;
      final exists = _getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    });
  });
}

File _getProjectFile(String path) {
  final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS'];
  return File('$assetFolderPath/$path');
}