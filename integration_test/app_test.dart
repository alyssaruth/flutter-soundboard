import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';
import 'package:pocket_scat/widget/app.dart';
import 'package:pocket_scat/widget/quote_button.dart';

final quoteOne = ALL_QUOTES[0];
final quoteTwo = ALL_QUOTES[1];
final testQuotes = [quoteOne, quoteTwo];

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('can filter by search and cancel search', (WidgetTester tester) async {
    await tester.pumpWidget(App(testQuotes));

    expect(find.widgetWithText(QuoteButton, quoteOne.name), findsOneWidget);
    expect(find.widgetWithText(QuoteButton, quoteTwo.name), findsOneWidget);

    // Tap the search icon and enter text
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    await tester.enterText(find.byType(TextField), quoteTwo.name);
    await tester.pump();

    // Verify that our search has been applied
    expect(find.widgetWithText(QuoteButton, quoteOne.name), findsNothing);
    expect(find.widgetWithText(QuoteButton, quoteTwo.name), findsOneWidget);

    // Close the search
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    // Search should be cancelled
    expect(find.widgetWithText(QuoteButton, quoteOne.name), findsOneWidget);
    expect(find.widgetWithText(QuoteButton, quoteTwo.name), findsOneWidget);
  });

  testWidgets('can play back quotes', (WidgetTester tester) async {
    const app = App(ALL_QUOTES);
    await tester.pumpWidget(app);
    expect(app.getAudioPlayerState(), PlayerState.stopped);

    await tester.tap(find.text(ALL_QUOTES[0].name));
    await tester.pump(const Duration(milliseconds: 500));

    expect(app.getAudioPlayerState(), PlayerState.playing);

    await tester.pumpAndSettle();

    expect(app.getAudioPlayerState(), PlayerState.completed);
  });

  testWidgets('can share quotes', (WidgetTester tester) async {
    final app = App(testQuotes);
    await tester.pumpWidget(app);

    expect(app.getQuoteCurrentlyBeingShared(), null);

    await tester.longPress(find.text(ALL_QUOTES[0].name));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));

    expect(app.getQuoteCurrentlyBeingShared(), ALL_QUOTES[0]);
  });
}
