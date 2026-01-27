import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/core/injection_container/injection_container.dart'
    as firebase_services;

import 'package:google_maps_showcase/features/map_example_1/injection_container.dart'
    as map_example_1_injection_container;

import 'package:google_maps_showcase/features/map_example_2/injection_container.dart'
    as map_example_2_injection_container;

import 'package:google_maps_showcase/core/cubits/injection_container.dart'
    as common_cubits;

import 'package:google_maps_showcase/core/http_client/injection_container.dart'
    as http_client;

import 'package:google_maps_showcase/features/street_view/injector_container.dart'
    as street_view_injector;

final sl = GetIt.instance;

Future<void> init() async {
  // firebase_services.init();
  http_client.init();
  common_cubits.init();
  street_view_injector.init();
  map_example_1_injection_container.init();
  map_example_2_injection_container.init();
}
