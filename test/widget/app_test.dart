import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quotes_list.dart';
import 'package:pocket_scat/widget/app.dart';

final quoteA = ALL_QUOTES[0];
final quoteB = ALL_QUOTES[1];

void main() {
  void _launchTestApp() {
    runApp(const App(ALL_QUOTES));

    expect(find.text(quoteA.name), findsOneWidget);
    expect(find.text(quoteB.name), findsOneWidget);
  }

  testWidgets('Should search quotes, and clear the search when cancelled', (WidgetTester tester) async {
    _launchTestApp();

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

  testWidgets('Should be able to search and cancel using keyboard only', (WidgetTester tester) async {
    _launchTestApp();

    final searchButton = tester.element(find.byIcon(Icons.search));
    final searchButtonFocus = Focus.of(searchButton);
    expect(searchButtonFocus.hasFocus, isFalse);
    expect(find.byType(TextField), findsNothing);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    expect(searchButtonFocus.hasFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isTrue);

    tester.testTextInput.enterText(quoteB.name.substring(2));

    await tester.pump();
    expect(find.text(quoteA.name), findsNothing);
    expect(find.text(quoteB.name), findsOneWidget);
  });
}
