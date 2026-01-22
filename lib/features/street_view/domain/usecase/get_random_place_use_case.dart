import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/street_view/domain/repositories/street_view_repository.dart';

class GetRandomPlaceForStreetViewUseCase extends UseCase<LatLng?, NoParams> {
  final StreetViewRepository? streetViewRepository;

  GetRandomPlaceForStreetViewUseCase({required this.streetViewRepository});

  @override
  Future<Either<Failure, LatLng?>> call(NoParams params) async {
    return await streetViewRepository!.getStreetViewRandomPlace();
  }
}
