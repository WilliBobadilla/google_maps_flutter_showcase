import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_compass_v2/flutter_compass_v2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/constants_values/assets.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/core/utils/custom_icon_maps_utils.dart';
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
        duration: const Duration(seconds: 2),
        CameraUpdate.newCameraPosition(
          CameraPosition(target: initialPosition, zoom: 15),
        ),
      );
    }

    print("Current location result: $currentLocation");
    currentLocation.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (position) async {
        emit(
          state.copyWith(
            controller: controller,
            selectedPosition: LatLng(position.latitude, position.longitude),
            marker: Marker(
              icon: await BitmapDescriptor.asset(
                ImageConfiguration.empty,
                CustomAssets.wIcon,
                width: 50,
              ),
              draggable: true,
              markerId: const MarkerId('current_location'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: const InfoWindow(title: 'Current location'),
              onDragStart: (value) {
                developer.log("Marker drag started at $value");
              },
              onDragEnd: (value) {
                developer.log("Marker drag started at $value");
              },
              onTap: () {
                developer.log(
                  "Marker tapped at ${position.latitude}, ${position.longitude}",
                );
              },
            ),
          ),
        );
      },
    );
  }

  void onMapTypeChanged() {
    developer.log("map type index: ${state.mapTypeIndex}");

    // Skip MapType.none
    int nextIndex = state.mapTypeIndex + 1;
    if (nextIndex >= MapType.values.length) {
      nextIndex = 1; // Reset to MapType.normal
    }

    developer.log("map type index changing to: $nextIndex");
    developer.log("map type now is ${MapType.values[nextIndex]}");
    emit(
      state.copyWith(
        mapType: MapType.values[nextIndex],
        mapTypeIndex: nextIndex,
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

  void onReCenterPosition() async {
    final rotationEvent = await FlutterCompass.events?.first;
    developer.log("last Rotation event: ${state.lastRotation}");
    developer.log("current Rotation event: ${rotationEvent?.heading}");
    final currentRotation = rotationEvent?.heading ?? 0;
    state.controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: currentRotation,
          target: state.selectedPosition ?? LatLng(0, 0),
          zoom: 15,
        ),
      ),
    );
    emit(state.copyWith(lastRotation: currentRotation)); // TODO: check this
  }

  void onCameratiltleChanged(double tilt) {
    state.controller!.animateCamera(
      duration: const Duration(seconds: 2),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: state.selectedPosition ?? LatLng(0, 0),
          zoom: 15,
          tilt: tilt,
        ),
      ),
    );
    emit(state.copyWith(cameraTilt: tilt));
  }
}
