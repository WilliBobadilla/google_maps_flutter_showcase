import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';

class PolylineUtils {
  static Polyline buildRoutePolyline(DirectionsResponseEntity directions) {
    final encoded = directions.routes!.first.overviewPolyline?.points ?? '';
    final points = decodePolyline(encoded);
    return Polyline(
      polylineId: const PolylineId('route'),
      points: points,
      width: 6,
      color: Colors.blue,
      patterns: [PatternItem.dash(50), PatternItem.gap(20)],
      geodesic: true,
      consumeTapEvents: true,
      onTap: () {
        developer.log("polyline tapped");
      },
    );
  }

  /// Decodes an encoded polyline string into a list of LatLng points.
  ///
  /// The algorithm follows the Google Maps API's Polyline Algorithm:
  /// https://developers.google.com/maps/documentation/utilities/polylinealgorithm
  ///
  /// The encoding is a string of ASCII characters, where each character is
  /// represented by 7 bits. The first 5 bits represent the delta value,
  /// and the last 2 bits represent the type of delta (latitude or longitude).
  ///
  /// The decoding process involves reading the encoded string, character by
  /// character, and shifting the bits to extract the delta values. The delta
  /// values are then added to the current latitude and longitude, and the
  /// resulting points are added to the list of LatLng points.
  static List<LatLng> decodePolyline(String encoded) {
    final List<LatLng> points = [];
    int index = 0;
    int lat = 0;
    int lng = 0;

    while (index < encoded.length) {
      int shift = 0;
      int result = 0;
      int byte;

      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      final deltaLat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += deltaLat;

      shift = 0;
      result = 0;

      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      final deltaLng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += deltaLng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }
}
