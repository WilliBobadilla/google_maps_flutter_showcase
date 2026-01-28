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
      appBar: AppBar(title: const Text('Maps Example One')),
      body: BlocBuilder<Maps2FormCubit, Maps2FormState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                mapToolbarEnabled: true,
                initialCameraPosition:
                    state.initialCameraPosition ?? kGooglePlex,
                //fortyFiveDegreeImageryEnabled: true,
                polylines: state.polyline != null ? {state.polyline!} : {},
                mapType: MapType.normal,
                markers: state.currentLocationmarker != null
                    ? {
                        state.currentLocationmarker!,
                        state.destinationLocationmarker!,
                      }
                    : {},
                onMapCreated: (GoogleMapController controller) {
                  context.read<Maps2FormCubit>().onMapCreated(controller);
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.directions),
        onPressed: () {
          context.read<Maps2FormCubit>().onRequestDirections();
        },
      ),
    );
  }
}
