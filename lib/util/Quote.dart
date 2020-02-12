import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'QuoteCategory.dart';
import 'QuoteSource.dart';

//Bit dirty, but keep a global reference to the latest audioPlayer created so we can stop it if another quote is played in the meantime
AudioPlayer _audioPlayer;

class Quote {
  final String filename;
  final String name;
  final QuoteSource source;
  final String searchStr;
  final String imageName;

  const Quote(this.filename, this.name, this.source, this.searchStr, [this.imageName]);

  bool containsSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) return true;

    final lowerCased = searchTerm.toLowerCase();

    return searchStr.toLowerCase().contains(lowerCased)
        || source.containsSearchTerm(lowerCased)
        || QuoteCategoryDesc[source.category].toLowerCase().contains(lowerCased);
  }

  AssetImage getImage() {
    if (imageName != null) {
      return new AssetImage('assets/images/$imageName.png');
    }

    if (source.imageName != null) {
      return new AssetImage('assets/images/${source.imageName}.png');
    }

    return new AssetImage('assets/images/abe.png');
  }

  Future share(BuildContext context) async {
    final AssetBundle bundle = DefaultAssetBundle.of(context);
    final fullFilename = "$filename.wav";
    final ByteData bytes = await bundle.load('assets/$fullFilename');
    await Share.file(name, fullFilename, bytes.buffer.asUint8List().toList(), 'media/wav', text: name);
  }

  Future play() async {
    await _audioPlayer?.stop();
    _audioPlayer = await AudioCache().play("$filename.wav");
  }
}