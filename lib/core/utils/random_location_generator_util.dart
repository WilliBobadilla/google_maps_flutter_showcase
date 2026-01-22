import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class RandomLocationGenerator {
  static LatLng randomLatLng() {
    final rnd = Random();
    return LatLng(rnd.nextDouble() * 170 - 85, rnd.nextDouble() * 360 - 180);
  }
}
