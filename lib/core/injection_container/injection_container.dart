import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart'
    as firebase_services;

import 'package:google_maps_showcase/features/map_example_1/injection_container.dart'
    as map_example_1_injection_container;

import 'package:google_maps_showcase/core/cubits/injection_container.dart'
    as common_cubits;

final sl = GetIt.instance;

Future<void> init() async {
  // firebase_services.init();
  map_example_1_injection_container.init();
  common_cubits.init();
}
