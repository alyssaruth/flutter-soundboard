import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocket_scat/util/injected_things.dart';

import 'quote_source.dart';

//Keep a reference to the latest audioPlayer so we can stop it if another quote is played in the meantime
AudioPlayer _audioPlayer;

class Quote {
  final String filename;
  final String name;
  final QuoteSource source;
  final String searchStr;
  final String imageName;
  final String imagePath;

  const Quote(this.filename, this.name, this.source, this.searchStr, [this.imageName, this.imagePath = 'assets/images']);

  bool containsSearchTerm(String searchTerm) {
    if (searchTerm.isEmpty) return true;

    final lowerCased = searchTerm.toLowerCase();

    return name.toLowerCase().contains(lowerCased) ||
        searchStr.toLowerCase().contains(lowerCased) ||
        source.containsSearchTerm(lowerCased);
  }

  AssetImage getImage() {
    if (imageName != null) {
      return AssetImage('$imagePath/$imageName.png');
    }

    return AssetImage('$imagePath/${source.imageName}.png');
  }

  Future shareAudio(BuildContext context) async {
    final fullFilename = '$filename.wav';
    await fileSharer.shareFile(name, fullFilename, context, 'media/wav');
  }

  Future play() async {
    await _audioPlayer?.stop();
    _audioPlayer = await audioCache.play('$filename.wav');
  }
}

PlayerState getPlaybackState() => _audioPlayer?.state;
