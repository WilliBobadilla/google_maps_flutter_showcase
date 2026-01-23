import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/features/street_view/domain/entities/city_box_entity.dart';

LatLng kInitialPosition = const LatLng(-25.3273547, -57.5470296);

final CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(kInitialPosition.latitude, kInitialPosition.longitude),
  zoom: 14.4746,
);

const kStreetViewInitialPosition = LatLng(-25.3273547, -57.5470296);
String streetViewHtml = """
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
  <style>
    html, body, #panorama {
      height: 100%;
      margin: 0;
      padding: 0;
    }
  </style>

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe33cLMFdyn_5EgddBCRQIPYci_4SI0b4"></script>

  <script>
    let panorama;

    function initialize() {
      panorama = new google.maps.StreetViewPanorama(
        document.getElementById('panorama'),
        {
          position: { lat: {latitude}, lng: {longitude} },
          pov: { heading: 165, pitch: 0 },
          zoom: 1
        }
      );

      // Listen for position changes
      panorama.addListener('position_changed', sendLocationToFlutter);
    }

    function sendLocationToFlutter() {
      const pos = panorama.getPosition();
      if (!pos) return;

      const data = {
        lat: pos.lat(),
        lng: pos.lng()
      };

      // Send to Flutter
      if (window.StreetViewChannel) {
        StreetViewChannel.postMessage(JSON.stringify(data));
      }
    }
  </script>
</head>

<body onload="initialize()">
  <div id="panorama"></div>
</body>
</html>

""";

const List<CityBoxEntity> cityBoxes = [
  CityBoxEntity(
    name: 'New York',
    minLat: 40.49,
    minLng: -74.26,
    maxLat: 40.92,
    maxLng: -73.68,
  ),
  CityBoxEntity(
    name: 'Paris',
    minLat: 48.80,
    minLng: 2.25,
    maxLat: 48.90,
    maxLng: 2.42,
  ),
  CityBoxEntity(
    name: 'Tokyo',
    minLat: 35.60,
    minLng: 139.60,
    maxLat: 35.75,
    maxLng: 139.80,
  ),

  // Asunción, Paraguay
  CityBoxEntity(
    name: 'Asunción',
    minLat: -25.36,
    minLng: -57.68,
    maxLat: -25.24,
    maxLng: -57.52,
  ),
];
