import 'package:fpdart/fpdart.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/repositories/map_example_2_repository.dart';

class GetDirectionsUseCase
    extends UseCase<DirectionsResponseEntity, DirectionsRequestEntity> {
  final MapExample2Repository _mapSelectionRepository;

  GetDirectionsUseCase({required MapExample2Repository mapSelectionRepository})
    : _mapSelectionRepository = mapSelectionRepository;

  @override
  Future<Either<Failure, DirectionsResponseEntity>> call(
    DirectionsRequestEntity params,
  ) async {
    return await _mapSelectionRepository.getDirections(params);
  }
}
