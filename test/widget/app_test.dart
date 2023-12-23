import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';
import 'package:pocket_scat/widget/app.dart';

final testQuotes = ALL_QUOTES.sublist(0, 5);
final quoteA = testQuotes[0];
final quoteB = testQuotes[1];

void main() {
  testWidgets('Should search quotes, and clear the search when cancelled', (WidgetTester tester) async {
    await tester.pumpWidget(App(testQuotes));

    expect(find.text(quoteA.name), findsOneWidget);
    expect(find.text(quoteB.name), findsOneWidget);

    // Tap the search icon and enter text
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    await tester.enterText(find.byType(TextField), quoteB.name);
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
}
