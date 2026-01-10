import 'package:flutter/material.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/widget/google_maps_wrapper_widget.dart';

class MapsExampleOneView extends StatelessWidget {
  const MapsExampleOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maps Example One')),
      body: Expanded(child: const MapsFormWidget()),
    );
  }
}
