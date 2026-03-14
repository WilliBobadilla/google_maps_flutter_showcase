import 'package:geolocator/geolocator.dart';

abstract class MapSelectionRemoteSource {
  Future<Position> getCurrentLocation();
}

class MapSelectionRemoteSourceImpl implements MapSelectionRemoteSource {
  @override
  Future<Position> getCurrentLocation() {
    // should be in a util
    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }
}
