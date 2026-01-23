import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/features/street_view/domain/entities/city_box_entity.dart';

class RandomLocationGenerator {
  static LatLng randomLatLng() {
    final rnd = Random();
    return LatLng(rnd.nextDouble() * 170 - 85, rnd.nextDouble() * 360 - 180);
  }

  static LatLng randomPointInCity(CityBoxEntity box) {
    final random = Random();

    final lat = box.minLat + random.nextDouble() * (box.maxLat - box.minLat);
    final lng = box.minLng + random.nextDouble() * (box.maxLng - box.minLng);

    return LatLng(lat, lng);
  }
}
