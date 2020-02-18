import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class FileSharer {
  Future<void> shareFile(String name, String filename, ByteData bytes, String mimeType) async {
    return await Share.file(name, filename, bytes.buffer.asUint8List(), mimeType, text: name);
  }
}