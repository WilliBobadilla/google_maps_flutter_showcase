import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';

abstract class MapSelectionRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
}
