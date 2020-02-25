import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Search', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final searchBarFinder =  find.byType("TextField");
    final erroneousFinder = find.text('Erroneous dish');
    final brainFinder = find.text('Piece of your brain');
    final searchFinder = find.byType('IconButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('can filter by search and cancel search', () async {
      expect(await isPresent(searchBarFinder, driver), false);
      expect(await isPresent(erroneousFinder, driver), true);
      expect(await isPresent(brainFinder, driver), true);

      await driver.tap(searchFinder);
      expect(await isPresent(searchBarFinder, driver), true);

      await driver.enterText('piece');
      expect(await isPresent(erroneousFinder, driver), false);
      expect(await isPresent(brainFinder, driver), true);

      await driver.tap(searchFinder);
      expect(await isPresent(searchBarFinder, driver), false);
      expect(await isPresent(erroneousFinder, driver), true);
      expect(await isPresent(brainFinder, driver), true);
    });

    /**
     * Doesn't seem to be possible to verify that the share window appears. See e.g. https://stackoverflow.com/questions/58352785/how-to-run-integration-test-for-share-dialog-in-flutter
     */
//    test('can share quotes', () async {
//      expect(await isPresent(brainFinder, driver), true);
//
//      await longPress(brainFinder, driver);
//
//      expect(await isPresent(find.text('Share'), driver, timeout: Duration(seconds: 5)), true);
//      expect(await isPresent(find.text('fawlty_piece_of_your_brain.wav'), driver), true);
//
//      await driver.tap(brainFinder);
//
//      expect(await isPresent(find.text('Share'), driver, timeout: Duration(seconds: 5)), false);
//      expect(await isPresent(find.text('fawlty_piece_of_your_brain.wav'), driver), false);
//    });
  });
}

Future<bool> isPresent(SerializableFinder finder, FlutterDriver driver, {Duration timeout = const Duration(seconds: 1)}) async {
  try {
    await driver.waitFor(finder, timeout: timeout);
    return true;
  } catch (e) {
    return false;
  }
}

Future<void> longPress(SerializableFinder finder, FlutterDriver driver) async {
  await driver.scroll(finder, 0, 0, Duration(milliseconds: 400));
}
