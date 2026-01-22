import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/http_client/external_client.dart';

abstract class StreetViewRemoteSource {
  Future<LatLng?> getStreetViewRandomPlace({
    required LatLng location,
    required String apiKey,
    required int radius,
    int tryCount = 3,
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
    required LatLng location,
    required String apiKey,
    required int radius,
    int tryCount = 3,
  }) async {
    final url =
        '/place/nearbysearch/json'
        '?location=${location.latitude},${location.longitude}'
        '&radius=5000'
        '&type=tourist_attraction'
        '&key=$apiKey';

    final data = await client.get(url);

    if (data['status'] == 'OK' && data['results'].isNotEmpty) {
      final place = data['results'][Random().nextInt(data['results'].length)];
      final loc = place['geometry']['location'];
      return LatLng(loc['lat'], loc['lng']);
    }
    return null;
  }

  @override
  Future<bool> checkIfStreetViewAvailable({
    required LatLng location,
    required String apiKey,
  }) async {
    final url =
        '/api/streetview/metadata'
        '?location=${location.latitude},${location.longitude}'
        '&key=$apiKey';

    final data = await client.get(url);

    return data['status'] == 'OK';
  }
}
