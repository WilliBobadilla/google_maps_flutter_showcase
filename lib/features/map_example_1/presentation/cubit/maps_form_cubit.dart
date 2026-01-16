import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_compass_v2/flutter_compass_v2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

part 'maps_form_state.dart';

class MapsFormCubit extends Cubit<MapsFormState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  MapsFormCubit({required GetCurrentLocationUseCase getCurrentLocationUseCase})
    : _getCurrentLocationUseCase = getCurrentLocationUseCase,
      super(MapsFormInitial());

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
        duration: Duration(seconds: 2),
        CameraUpdate.newCameraPosition(
          CameraPosition(target: initialPosition, zoom: 15),
        ),
      );

      FlutterCompass.events?.listen(_centerViewInNavigation);
    }

    print("Current location result: $currentLocation");
    currentLocation.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (position) => emit(
        state.copyWith(
          controller: controller,
          selectedPosition: LatLng(position.latitude, position.longitude),
          marker: Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(title: 'Current location'),
            onTap: () {
              print(
                "Marker tapped at ${position.latitude}, ${position.longitude}",
              );
            },
          ),
        ),
      ),
    );
  }

  void onSelectPosition(LatLng position) {
    emit(
      state.copyWith(
        selectedPosition: position,
        marker: state.marker != null
            ? state.marker!.copyWith(positionParam: position)
            : Marker(
                markerId: const MarkerId('current_location'),
                position: position,
              ),
      ),
    );
  }

  void _centerViewInNavigation(CompassEvent rotationEvent) {
    developer.log('Compass event: $rotationEvent');
    if (rotationEvent.heading! - (state.lastRotation ?? 0) > 5) {
      state.copyWith(lastRotation: rotationEvent.heading);
      state.controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: rotationEvent.heading ?? 0,
            target: state.selectedPosition ?? LatLng(0, 0),
            zoom: 15,
          ),
        ),
      );
    }
  }
}
