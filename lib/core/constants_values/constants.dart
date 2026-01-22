import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng kInitialPosition = const LatLng(-25.3273547, -57.5470296);

final CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(kInitialPosition.latitude, kInitialPosition.longitude),
  zoom: 14.4746,
);

const kStreetViewInitialPosition = LatLng(-25.3273547, -57.5470296);
const streetViewHtml = '''
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
          position: { lat: -25.3273547, lng: -57.5470296 },
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

''';
