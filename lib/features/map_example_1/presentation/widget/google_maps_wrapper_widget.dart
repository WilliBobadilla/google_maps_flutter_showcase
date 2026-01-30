import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/constants.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/cubit/maps_form_cubit.dart';

//example to use google maps with markers
class MapsFormWidget extends StatefulWidget {
  final LatLng? initialPosition;
  final Function(LatLng)? onPositionSelected;

  const MapsFormWidget({
    super.key,
    this.initialPosition,
    this.onPositionSelected,
  });

  @override
  State<MapsFormWidget> createState() => MapsFormWidgetState();
}

class MapsFormWidgetState extends State<MapsFormWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsFormCubit, MapsFormState>(
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              trafficEnabled: true,
              zoomControlsEnabled: true,
              compassEnabled: true,
              buildingsEnabled: true,
              initialCameraPosition: state.initialCameraPosition ?? kGooglePlex,
              mapType: state.mapType ?? MapType.normal,
              markers: state.marker != null ? {state.marker!} : {},
              onMapCreated: (GoogleMapController controller) {
                context.read<MapsFormCubit>().onMapCreated(controller);
              },
              onTap: (LatLng position) {
                context.read<MapsFormCubit>().onSelectPosition(position);
              },
            ),
            Positioned(
              bottom: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                child: Slider(
                  min: 0,
                  max: 90,
                  value: state.cameraTilt,
                  onChanged: (value) {
                    context.read<MapsFormCubit>().onCameratiltleChanged(value);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
