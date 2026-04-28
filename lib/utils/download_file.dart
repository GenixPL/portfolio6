import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:web/web.dart' as web;

Future<void> downloadFile({
  required String assetPath,
  required String fileName,
  required String type,
}) async {
  try {
    // 1. Load the PDF file from assets as ByteData
    final ByteData data = await rootBundle.load(assetPath);

    // 2. Convert ByteData to Uint8List
    final Uint8List bytes = data.buffer.asUint8List();

    // 3. Create a Blob and trigger download (Modern package:web approach)
    final blob = web.Blob(
      [bytes.toJS].toJS,
      web.BlobPropertyBag(
        type: type,
      ),
    );

    final url = web.URL.createObjectURL(blob);
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement
      ..href = url
      ..download = fileName
      ..style.display = 'none';

    web.document.body?.append(anchor);
    anchor.click();

    // Cleanup
    anchor.remove();
    web.URL.revokeObjectURL(url);
  } catch (e) {
    print('Error downloading asset: $e');
    rethrow;
  }
}
