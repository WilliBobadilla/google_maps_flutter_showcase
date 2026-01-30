import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/features/street_view/presentation/cubit/guess_the_location_form_cubit.dart';

class GuessTheLocationView extends StatelessWidget {
  const GuessTheLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Guess The Location')),
    body: BlocBuilder<GuessTheLocationFormCubit, GuessTheLocationFormState>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: true,
              initialCameraPosition: state.initialCameraPosition ?? kGooglePlex,
              //fortyFiveDegreeImageryEnabled: true,
              mapType: MapType.normal,
              markers: state.currentLocationmarker != null
                  ? {state.currentLocationmarker!}
                  : {},
              onMapCreated: (GoogleMapController controller) {
                context.read<GuessTheLocationFormCubit>().onMapCreated(
                  controller,
                );
              },
              onTap: (LatLng position) {
                context
                    .read<GuessTheLocationFormCubit>()
                    .onChangeMarkerPosition(position);
              },
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<GuessTheLocationFormCubit>()
                      .onCheckGuessedPosition();
                },
                child: const Text('Check Location'),
              ),
            ),
          ],
        );
      },
    ),
  );
}
