import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pocket_scat/util/file_sharer.dart';
import 'package:pocket_scat/util/globals.dart';
import 'package:pocket_scat/util/quote.dart';
import 'package:pocket_scat/util/quote_category.dart';
import 'package:pocket_scat/util/quote_source.dart';
import 'mocks.dart';

@GenerateNiceMocks([MockSpec<AudioPlayer>(), MockSpec<FileSharer>()])
import 'quote_test.mocks.dart';

void main() {
  const sourceA = QuoteSource('Fawlty Towers', QuoteCategory.SITCOM, 'fawlty_towers', 'basil manuel');
  const sourceB = QuoteSource('Mr. Bean', QuoteCategory.SITCOM, 'bean', 'mr bean');

  group('search', () {
    test('should always contain an empty search', () {
      const quote = Quote('file_name', 'bar', sourceA, '');
      expect(quote.containsSearchTerm(''), true);
    });

    test('should be searchable by name', () {
      const quote = Quote('file_name', 'Some Text', sourceA, '');
      expect(quote.containsSearchTerm('Some Text'), true);
      expect(quote.containsSearchTerm('sOmE tExT'), true);
      expect(quote.containsSearchTerm('some'), true);
      expect(quote.containsSearchTerm('text'), true);
      expect(quote.containsSearchTerm('other text'), false);
    });

    test('should be searchable by search string', () {
      const quote = Quote('file_name', 'Some Text', sourceA, 'the quote is actually this');
      expect(quote.containsSearchTerm('the quote is actually this'), true);
      expect(quote.containsSearchTerm('aCtUALLy'), true);
      expect(quote.containsSearchTerm('tual'), true);
      expect(quote.containsSearchTerm('not this'), false);
    });

    test('should be searchable by quote source', () {
      const quote = Quote('file_name', 'Some Text', sourceA, '');
      expect(quote.containsSearchTerm('fawlty'), true);
      expect(quote.containsSearchTerm('bean'), false);
    });
  });

  group('getImage', () {
    test('should return its own image path if one is specified', () {
      const quote = Quote('file_name', 'Some text', sourceA, 'some search terms', 'my_custom_image');
      final img = quote.getImage();

      expect(img.keyName, 'assets/images/my_custom_image.png');
    });

    test('should fall back on source image path if not specified', () {
      const quote = Quote('file_name', 'Some text', sourceA, 'some search terms');
      final img = quote.getImage();

      expect(img.keyName, 'assets/images/fawlty_towers.png');
    });
  });

  group('playback', () {
    void _verifyAudioPlayed(MockAudioPlayer audioPlayer, String assetName) {
      verify(audioPlayer.stop());

      final source = verify(audioPlayer.play(captureThat(isInstanceOf<AssetSource>()))).captured;
      expect((source.single as AssetSource).path, assetName);

      verifyNoMoreInteractions(audioPlayer);
    }

    test('should play the associated audio file', () async {
      const quote = Quote('file_name', 'Some text', sourceA, '');
      final mockAudioPlayer = MockAudioPlayer();
      audioPlayer = mockAudioPlayer;

      await quote.play();
      _verifyAudioPlayed(mockAudioPlayer, 'file_name.mp3');
    });

    test('should stop the previous audio player if it exists before playing a new sound', () async {
      const quoteOne = Quote('file_name', 'Some text', sourceA, '');
      const quoteTwo = Quote('other_file', 'Other text', sourceB, '');

      final mockAudioPlayer = MockAudioPlayer();
      audioPlayer = mockAudioPlayer;

      await quoteOne.play();
      _verifyAudioPlayed(mockAudioPlayer, 'file_name.mp3');
      await quoteTwo.play();
      _verifyAudioPlayed(mockAudioPlayer, 'other_file.mp3');
    });
  });

  group('sharing', () {
    test('should share the audio file', () async {
      const quote = Quote('file_name', 'Some text', sourceA, '');
      final buildContext = MockBuildContext();
      fileSharer = MockFileSharer();

      await quote.shareAudio(buildContext);

      verify(fileSharer.shareFile('Some text', 'file_name.mp3', buildContext, 'audio/mpeg'));
    });
  });
}
