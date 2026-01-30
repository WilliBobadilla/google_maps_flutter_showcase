import 'package:flutter/material.dart';
import 'package:google_maps_showcase/core/constants_values/sizes.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/pages/maps_example_one_page.dart';
import 'package:google_maps_showcase/features/map_example_2/presentation/pages/maps_example_2_page.dart';
import 'package:google_maps_showcase/features/street_view/presentation/pages/street_view_page.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Google Maps Showcase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ejemplos'),
            const SizedBox(height: Sizes.kDivisions),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MapsExampleOnePage.route);
              },
              child: const Text(
                'Example 1, Current Position, Camera control, Marker, etc',
              ),
            ),
            const SizedBox(height: Sizes.kDivisions),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MapsExample2Page.route);
              },
              child: const Text(
                'Example 2, Custom Markers, Polylines, Circles, etc',
              ),
            ),

            const SizedBox(height: Sizes.kDivisions),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, StreetViewPage.route);
              },
              child: const Text('Example 3, Street View'),
            ),
          ],
        ),
      ),
    );
  }
}
