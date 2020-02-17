import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quote_source.dart';
import 'package:pocket_scat/util/quote.dart';

void main() {
  test('should always contain an empty search', () {
    final quote = Quote("file_name", "bar", SRC_TOAST, "");
    expect(quote.containsSearchTerm(""), true);
  });

  test('should be searchable by name', () {
    final quote = Quote("file_name", "Some Text", SRC_TOAST, "");
    expect(quote.containsSearchTerm("Some Text"), true);
    expect(quote.containsSearchTerm("sOmE tExT"), true);
    expect(quote.containsSearchTerm("some"), true);
    expect(quote.containsSearchTerm("text"), true);
    expect(quote.containsSearchTerm("other text"), false);
  });

  test('should be searchable by search string', () {
    final quote = Quote("file_name", "Some Text", SRC_TOAST, "the quote is actually this");
    expect(quote.containsSearchTerm("the quote is actually this"), true);
    expect(quote.containsSearchTerm("aCtUALLy"), true);
    expect(quote.containsSearchTerm("tual"), true);
    expect(quote.containsSearchTerm("not this"), false);
  });

  test('should be searchable by quote source', () {
    final quote = Quote("file_name", "Some Text", SRC_TOAST, "");
    expect(quote.containsSearchTerm("toast of london"), true);
    expect(quote.containsSearchTerm("curb"), false);
  });

  test('should be searchable by quote category', () {
    final quote = Quote("file_name", "Some Text", SRC_TOAST, "");
    expect(quote.containsSearchTerm("sitcom"), true);
    expect(quote.containsSearchTerm("kids tv"), false);
  });
}