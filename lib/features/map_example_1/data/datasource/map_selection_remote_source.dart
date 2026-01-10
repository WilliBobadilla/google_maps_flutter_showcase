import 'package:geolocator/geolocator.dart';

abstract class MapSelectionRemoteSource {
  Future<Position> getCurrentLocation();
}

class MapSelectionRemoteSourceImpl implements MapSelectionRemoteSource {
  @override
  Future<Position> getCurrentLocation() {
    return Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
  }
}
