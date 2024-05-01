import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:pocket_scat/util/file_sharer.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

class MockFileSharer extends Mock implements FileSharer {}

class MockBuildContext extends Mock implements BuildContext {}
