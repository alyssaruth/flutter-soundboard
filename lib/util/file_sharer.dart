import 'dart:io';

import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class FileSharer {
  Future<ShareResult> shareFile(String name, String filename, BuildContext context, String mimeType) async {
    final bundle = DefaultAssetBundle.of(context);
    final bytes = await bundle.load('assets/$filename');
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$filename').create();
    await file.writeAsBytes(bytes.buffer.asUint8List());

    return Share.shareXFiles([XFile('${tempDir.path}/$filename', mimeType: mimeType, name: name)]);
  }
}
