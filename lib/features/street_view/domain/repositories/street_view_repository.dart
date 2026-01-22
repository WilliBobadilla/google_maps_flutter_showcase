import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';

abstract class StreetViewRepository {
  Future<Either<Failure, LatLng>> getStreetViewRandomPlace();
}
