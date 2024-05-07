import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';

void main() {
  test('specified audio file should exist for all quotes', () {
    for (final quote in ALL_QUOTES) {
      final expectedPath = 'assets/${quote.filename}.mp3';
      final exists = _getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    }
  });

  test('specified image should exist for all quotes', () {
    for (final quote in ALL_QUOTES) {
      final expectedPath = quote.getImage().keyName;
      final exists = _getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    }
  });

  test('all assets should be used by at least one quote', () {
    final assetFolderPath = Platform.environment['UNIT_TEST_ASSETS'];
    final directory = Directory('$assetFolderPath/assets');
    final assets = directory.listSync(recursive: true);
    for (final asset in assets) {
      final path = asset.path.replaceFirst('$assetFolderPath/', '');

      if (path.endsWith('.mp3')) {
        final quotes = ALL_QUOTES.where((quote) => 'assets/${quote.filename}.mp3' == path);
        expect(quotes.isNotEmpty, isTrue, reason: '$path does not have a corresponding quote');
      } else if (path.endsWith('.png')) {
        final quotes = ALL_QUOTES.where((quote) => quote.getImage().assetName == path);
        expect(quotes.isNotEmpty, isTrue, reason: '$path does not have a corresponding quote');
      }
    }
  });
}

File _getProjectFile(String path) {
  final assetFolderPath = Platform.environment['UNIT_TEST_ASSETS'];
  return File('$assetFolderPath/$path');
}
