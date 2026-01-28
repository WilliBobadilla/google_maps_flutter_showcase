import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/http_client/external_client.dart';
import 'package:google_maps_showcase/features/map_example_2/data/models/directions_request_model.dart';
import 'package:google_maps_showcase/features/map_example_2/data/models/directions_response_model.dart';

abstract class MapExample2RemoteSource {
  Future<DirectionsResponseModel> getDirections(DirectionsRequestModel request);
}

class MapExample2RemoteSourceImpl implements MapExample2RemoteSource {
  final ExternalClient client;

  MapExample2RemoteSourceImpl({required this.client});
  @override
  Future<DirectionsResponseModel> getDirections(
    DirectionsRequestModel request,
  ) async {
    final apikey = dotenv.env['GOOGLE_API_REST_KEY'] ?? '';
    final url =
        '/directions/json'
        '?origin=${request.origin.latitude},${request.origin.longitude}'
        '&destination=${request.destination.latitude},${request.destination.longitude}'
        '&mode=driving'
        '&key=$apikey';

    final response = await client.get(url);
    //final data = json.decode(response.body);
    //developer.log(data);

    if (response['status'] == 'OK') {
      final points = response['routes'][0]['overview_polyline']['points'];
      //developer.log('points: $points');
      return DirectionsResponseModel.fromJson(response);
    } else {
      print('Directions error: ${response['status']}');
      return DirectionsResponseModel(
        status: "${response['status']}",
        routes: [],
      );
    }
  }
}
