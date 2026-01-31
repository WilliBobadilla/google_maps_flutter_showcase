import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRequestEntity {
  final LatLng origin;
  final LatLng destination;
  final List<LatLng>? waypoints;
  //maybe add here more params like waypoints, route type, etc

  DirectionsRequestEntity({
    required this.origin,
    required this.destination,
    this.waypoints,
  });
}
