import 'package:fpdart/fpdart.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';

abstract class MapExample2Repository {
  Future<Either<Failure, DirectionsResponseEntity>> getDirections(
    DirectionsRequestEntity request,
  );
}
