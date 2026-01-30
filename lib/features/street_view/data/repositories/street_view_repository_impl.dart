import 'dart:developer' as developer;
import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/core/utils/random_location_generator_util.dart';
import 'package:google_maps_showcase/features/street_view/data/datasource/street_view_remote_source.dart';
import 'package:google_maps_showcase/features/street_view/domain/repositories/street_view_repository.dart';

class StreetViewRepositoryImpl implements StreetViewRepository {
  final StreetViewRemoteSource remoteSource;

  StreetViewRepositoryImpl({required this.remoteSource});

  @override
  Future<Either<Failure, LatLng>> getStreetViewRandomPlace() async {
    try {
      final apikey = dotenv.env['GOOGLE_API_REST_KEY'] ?? '';
      const radius = 50000; // in meters
      const tryCount = 3;
      final random = Random();
      for (int attempt = 0; attempt < tryCount; attempt++) {
        final city = kCityBoxes[random.nextInt(kCityBoxes.length)];
        final randomLocation = RandomLocationGenerator.randomPointInCity(city);
        final result = await remoteSource.getStreetViewRandomPlace(
          randomLocation: randomLocation,
          apiKey: apikey, // maybe we can move it to the client
          radius: radius,
        );
        developer.log("Street view attempt ${attempt + 1}: $result");
        return right(result!);
      }
      return left(const ServerFailure(message: "No street view available"));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
