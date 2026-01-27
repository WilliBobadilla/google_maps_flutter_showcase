import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';

class DirectionsRequestModel extends DirectionsRequestEntity {
  DirectionsRequestModel({required super.origin, required super.destination});

  static DirectionsRequestModel fromEntity(DirectionsRequestEntity entity) {
    return DirectionsRequestModel(
      origin: entity.origin,
      destination: entity.destination,
    );
  }
}
