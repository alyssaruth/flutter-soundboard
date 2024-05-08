import 'package:audioplayers/audioplayers.dart';
import 'package:pocket_scat/util/file_sharer.dart';
import 'package:pocket_scat/util/quote.dart';

const APP_NAME = 'Pocket Scat';

FileSharer fileSharer = FileSharer();
AudioPlayer audioPlayer = AudioPlayer();
Quote? quoteBeingShared;
