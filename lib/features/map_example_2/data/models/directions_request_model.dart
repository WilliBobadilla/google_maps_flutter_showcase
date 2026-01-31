import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';

class DirectionsRequestModel extends DirectionsRequestEntity {
  final List<LatLng>? waypoints;

  DirectionsRequestModel({
    required super.origin,
    required super.destination,
    this.waypoints,
  }) : super(waypoints: waypoints);

  static DirectionsRequestModel fromEntity(DirectionsRequestEntity entity) {
    return DirectionsRequestModel(
      origin: entity.origin,
      destination: entity.destination,
      waypoints: entity.waypoints,
    );
  }
}
