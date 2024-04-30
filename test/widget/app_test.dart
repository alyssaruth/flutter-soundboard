import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/widget/app.dart';

import '../util/test_quotes.dart';

final quoteA = TEST_QUOTES[0];
final quoteB = TEST_QUOTES[1];

void main() {
  testWidgets('Should search quotes, and clear the search when cancelled', (WidgetTester tester) async {
    await tester.pumpWidget(const App(TEST_QUOTES));

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
}
