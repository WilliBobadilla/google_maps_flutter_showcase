import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/http_client/external_client.dart';
import 'package:google_maps_showcase/core/utils/random_location_generator_util.dart';

abstract class StreetViewRemoteSource {
  Future<LatLng?> getStreetViewRandomPlace({
    required LatLng randomLocation,
    required String apiKey,
    required int radius,
  });

  Future<bool> checkIfStreetViewAvailable({
    required LatLng location,
    required String apiKey,
  });
}

class StreetViewRemoteSourceImpl implements StreetViewRemoteSource {
  final ExternalClient client;

  StreetViewRemoteSourceImpl({required this.client});

  @override
  Future<LatLng?> getStreetViewRandomPlace({
    required LatLng randomLocation,
    required String apiKey,
    required int radius,
  }) async {
    final url =
        '/streetview/metadata'
        '?location=${randomLocation.latitude},${randomLocation.longitude}'
        '&radius=50000'
        '&key=$apiKey';

    final data = await client.get(url);

    if (data['status'] == 'OK' && data.containsKey('location')) {
      return LatLng(data['location']['lat'], data['location']['lng']);
    }

    return null;
  }

  @override
  Future<bool> checkIfStreetViewAvailable({
    required LatLng location,
    required String apiKey,
    int tryCount = 3,
  }) async {
    final url =
        '/api/streetview/metadata'
        '?location=${location.latitude},${location.longitude}'
        '&key=$apiKey';
    final data = await client.get(url);
    return data['status'] == 'OK';
  }
}
