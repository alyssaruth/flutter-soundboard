import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FileSharer {
  Future<void> shareFile(String name, String filename, BuildContext context, String mimeType) async {
    final AssetBundle bundle = DefaultAssetBundle.of(context);
    final ByteData bytes = await bundle.load('assets/$filename');
    return await Share.file(name, filename, bytes.buffer.asUint8List(), mimeType, text: name);
  }
}