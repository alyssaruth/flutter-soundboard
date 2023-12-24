import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';
import 'package:pocket_scat/widget/app.dart';

final testQuotes = ALL_QUOTES.sublist(0, 5);
final quoteA = testQuotes[0];
final quoteB = testQuotes[1];

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('can filter by search and cancel search', (WidgetTester tester) async {
    await tester.pumpWidget(App(testQuotes));

    expect(find.text(quoteA.name), findsOneWidget);
    expect(find.text(quoteB.name), findsOneWidget);

    // Tap the search icon and enter text
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    await tester.enterText(find.byType(TextField), quoteB.name.substring(2));
    await tester.pump();

    // Verify that our search has been applied
    expect(find.text(quoteA.name), findsNothing);
    expect(find.text(quoteB.name), findsOneWidget);

    // Close the search
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    // Search should be cancelled
    expect(find.text(quoteA.name), findsOneWidget);
    expect(find.text(quoteB.name), findsOneWidget);
  });

  testWidgets('can play back quotes', (WidgetTester tester) async {
    final app = App(testQuotes);
    await tester.pumpWidget(app);
    expect(app.getAudioPlayerState(), null);

    await tester.tap(find.text(quoteA.name));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(app.getAudioPlayerState(), PlayerState.PLAYING);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(app.getAudioPlayerState(), PlayerState.COMPLETED);
  });

  /**
   * TODO - Can't interact with native dialogs, so need to inject a mocked file sharer to test this
   */
  // testWidgets('can share quotes', (WidgetTester tester) async {
  //   const app = App(TEST_QUOTES);
  //   await tester.pumpWidget(app);
  //
  //   await tester.longPress(find.text('Piece of your brain'));
  //   await tester.pumpAndSettle(const Duration(milliseconds: 2000));
  //
  //   expect(find.text('Share'), findsOneWidget);
  // });
}
