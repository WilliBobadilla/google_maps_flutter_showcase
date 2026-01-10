import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_selection_repository.dart';

class GetCurrentLocationUseCase extends UseCase<Position, NoParams> {
  final MapSelectionRepository _mapSelectionRepository;

  GetCurrentLocationUseCase({
    required MapSelectionRepository mapSelectionRepository,
  }) : _mapSelectionRepository = mapSelectionRepository;

  @override
  Future<Either<Failure, Position>> call(NoParams params) async {
    return await _mapSelectionRepository.getCurrentLocation();
  }
}
