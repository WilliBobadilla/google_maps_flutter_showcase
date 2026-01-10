import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/features/map_example_1/data/datasource/map_selection_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_selection_repository.dart';

class MapSelectionRepositoryImpl implements MapSelectionRepository {
  final MapSelectionRemoteSource remoteSource;

  MapSelectionRepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final position = await remoteSource.getCurrentLocation();
      return Right(position);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
