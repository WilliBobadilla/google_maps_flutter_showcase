import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_showcase/core/utils/get_bytes_from_asset_uti.dart';

Future<maps.BitmapDescriptor> getCustomBitmapByPath(String path) async {
  var bytes = await getBytesFromAsset(path, 100);
  return maps.BitmapDescriptor.fromBytes(bytes);
}
