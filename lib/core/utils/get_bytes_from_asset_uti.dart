import 'dart:ui';
import 'dart:convert' hide Codec;
import 'package:flutter/services.dart';

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  Codec codec = await instantiateImageCodec(
    data.buffer.asUint8List(),
    targetWidth: width,
  );
  FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(
    format: ImageByteFormat.png,
  ))!.buffer.asUint8List();
}
