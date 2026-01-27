import 'package:flutter/material.dart';

class MapMarkerDashWidget extends StatelessWidget {
  const MapMarkerDashWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          image: AssetImage("assets/icons/dash_icon.png"),
          height: 150,
          width: 150,
        ),
        Text(text, style: const TextStyle(color: Colors.black, fontSize: 20)),
      ],
    );
  }
}
