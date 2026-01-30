import 'package:flutter/material.dart';
import 'package:google_maps_showcase/core/constants_values/assets.dart';

class MapMarkerWidget extends StatelessWidget {
  final String? iconDataPath;
  //maybe pass here the size, etc etc
  const MapMarkerWidget({super.key, this.iconDataPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(iconDataPath ?? CustomAssets.dashIcon),
          height: 150,
          width: 150,
        ),
      ],
    );
  }
}
