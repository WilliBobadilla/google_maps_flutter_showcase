import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/core/utils/custom_icon_maps_utils.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

part 'maps_2_form_state.dart';

class Maps2FormCubit extends Cubit<Maps2FormState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  Maps2FormCubit({required GetCurrentLocationUseCase getCurrentLocationUseCase})
    : _getCurrentLocationUseCase = getCurrentLocationUseCase,
      super(Maps2FormInitial());

  void onMapCreated(GoogleMapController controller) async {
    // You can store the controller if needed
    developer.log('Map created, fetching current location...');

    final currentLocation = await _getCurrentLocationUseCase.call(NoParams());
    final initialPosition = currentLocation.fold(
      (failure) => null,
      (position) => LatLng(position.latitude, position.longitude),
    );
    if (initialPosition != null) {
      controller.animateCamera(
        // duration: Duration(seconds: 2),
        CameraUpdate.newCameraPosition(
          CameraPosition(target: initialPosition, zoom: 15),
        ),
      );
    }
    emit(
      state.copyWith(
        controller: controller,
        destinationLocationMarker: Marker(
          icon: await MarkerGenerator(150).createBitmapDescriptorFromIconData(
            Icons.accessibility,
            Colors.green,
            Colors.transparent,
            Colors.transparent,
          ),
          markerId: const MarkerId('destination_location'),
          draggable: true,
          zIndexInt: state.zindexDestinationMarker ?? 0,
          onDragStart: (value) {
            developer.log("dragging the destination marker");
            emit(state.copyWith(zindexDestinationMarker: 2));
          },
          position: LatLng(
            initialPosition!.latitude + 0.1,
            initialPosition.longitude + 0.1,
          ),
          infoWindow: InfoWindow(title: 'Destination location'),
        ),
        curentLocationMarker: Marker(
          markerId: const MarkerId('current_location'),
          position: LatLng(
            initialPosition!.latitude,
            initialPosition.longitude,
          ),
          infoWindow: InfoWindow(title: 'Current location'),
        ),
      ),
    );
  }
}
