import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';

class FileSharer {
  Future<void> shareFile(String name, String filename, BuildContext context, String mimeType) async {
    final bundle = DefaultAssetBundle.of(context);
    final bytes = await bundle.load('assets/$filename');
    return Share.file(name, filename, bytes.buffer.asUint8List(), mimeType, text: name);
  }
}