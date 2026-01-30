import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/features/map_example_2/presentation/cubit/maps_2_form_cubit.dart';

class MapsExample2View extends StatelessWidget {
  const MapsExample2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maps Ejemplo 2')),
      body: BlocBuilder<Maps2FormCubit, Maps2FormState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                mapToolbarEnabled: true,
                initialCameraPosition:
                    state.initialCameraPosition ?? kGooglePlex,
                //fortyFiveDegreeImageryEnabled: true,
                mapType: MapType.normal,
                polylines: state.polylines != null
                    ? Set<Polyline>.from(state.polylines!)
                    : {},
                circles: state.circle != null
                    ? Set<Circle>.from([state.circle!])
                    : {},
                markers: state.currentLocationmarker != null
                    ? {
                        state.currentLocationmarker!,
                        state.destinationLocationmarker!,
                        ...state.waypoints ?? [],
                      }
                    : {},
                onMapCreated: (GoogleMapController controller) {
                  context.read<Maps2FormCubit>().onMapCreated(controller);
                },
                onTap: (LatLng position) {
                  context.read<Maps2FormCubit>().onMapTapped(position);
                },
              ),
              Positioned(
                top: 10,
                right: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.routeDuration ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // center the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            child: const Icon(Icons.directions),
            onPressed: () {
              context.read<Maps2FormCubit>().onRequestDirections();
            },
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            child: const Icon(Icons.center_focus_strong),
            onPressed: () {
              context.read<Maps2FormCubit>().onCenterView();
            },
          ),
        ],
      ),
    );
  }
}
