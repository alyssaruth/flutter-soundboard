import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';

void main() {
  test('specified audio file should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final expectedPath = 'assets/${quote.filename}.wav';
      final exists = getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    });
  });

  test('specified image should exist for all quotes', () {
    ALL_QUOTES.forEach((quote) {
      final expectedPath = quote.getImage().keyName;
      final exists = getProjectFile(expectedPath).existsSync();
      expect(exists, isTrue, reason: '$expectedPath does not exist');
    });
  });
}

File getProjectFile(String path) => _getProjectRootDirectory().childFile(path);
Directory _getProjectRootDirectory() {
  var dir = Directory.current;
  while (!_isProjectRootDirectory(dir)) {
    dir = dir.parent;
  }
  return dir;
}
bool _isProjectRootDirectory(Directory dir) => dir.listSync().any((entity) => entity.path.endsWith('pubspec.yaml'));

extension DirectoryMethods on Directory {
  File childFile(String name) => File('$path/$name');
}