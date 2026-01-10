import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/sizes.dart';
import 'package:google_maps_showcase/features/map_example_1/presentation/cubit/maps_form_cubit.dart';

class MapsFormWidget extends StatefulWidget {
  final Function(LatLng)? onPositionSelected;
  final LatLng? initialPosition;

  const MapsFormWidget({
    super.key,
    this.onPositionSelected,
    this.initialPosition,
  });

  @override
  State<MapsFormWidget> createState() => MapsFormWidgetState();
}

class MapsFormWidgetState extends State<MapsFormWidget> {
  @override
  void didUpdateWidget(covariant MapsFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialPosition != null &&
        widget.initialPosition != oldWidget.initialPosition) {
      context.read<MapsFormCubit>().loadInitialPosition(widget.initialPosition);
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-25.42796133580664, -57.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsFormCubit, MapsFormState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(Sizes.DEFAULT_RADIUS),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: GoogleMap(
              markers: state.marker != null ? {state.marker!} : {},
              mapType: MapType.normal,
              initialCameraPosition:
                  state.initialCameraPosition ?? _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                context.read<MapsFormCubit>().onMapCreated(controller);
              },
              onTap: (LatLng position) {
                //context.read<MapsFormCubit>().onSelectPosition(position);
                print(" Tapped position: $position");
                if (widget.onPositionSelected != null) {
                  widget.onPositionSelected!(position);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
