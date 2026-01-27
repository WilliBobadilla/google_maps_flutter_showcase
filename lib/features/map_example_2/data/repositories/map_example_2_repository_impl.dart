import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/features/map_example_2/data/datasource/map_example_2_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_2/data/models/directions_request_model.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/repositories/map_example_2_repository.dart';

class MapExample2RepositoryImpl implements MapExample2Repository {
  final MapExample2RemoteSource remoteSource;

  MapExample2RepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, DirectionsResponseEntity>> getDirections(
    DirectionsRequestEntity request,
  ) async {
    try {
      final result = await remoteSource.getDirections(
        DirectionsRequestModel.fromEntity(request),
      );
      return right(DirectionsResponseEntity());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
