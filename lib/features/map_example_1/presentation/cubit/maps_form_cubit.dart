import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

part 'maps_form_state.dart';

class MapsFormCubit extends Cubit<MapsFormState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  MapsFormCubit({required GetCurrentLocationUseCase getCurrentLocationUseCase})
    : _getCurrentLocationUseCase = getCurrentLocationUseCase,
      super(MapsFormInitial());

  void loadInitialPosition(LatLng? initialPosition) {
    developer.log('Loading initial position: $initialPosition');
    if (initialPosition != null) {
      emit(
        state.copyWith(
          selectedPosition: initialPosition,
          initialCameraPosition: CameraPosition(
            target: initialPosition,
            zoom: 14.4746,
          ),
          marker: Marker(
            markerId:
                state.marker?.markerId ?? const MarkerId('current_location'),
            position: initialPosition,
          ),
        ),
      );
      if (state.controller != null) {
        state.controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: initialPosition, zoom: 14.4746),
          ),
        );
      }
    }
  }

  void onMapCreated(GoogleMapController controller) async {
    // You can store the controller if needed
    developer.log('Map created, fetching current location...');
    final currentLocation = await _getCurrentLocationUseCase.call(NoParams());
    if (state.initialCameraPosition != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(state.initialCameraPosition!),
      );
    }
    currentLocation.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (position) => emit(
        state.copyWith(
          controller: controller,
          selectedPosition: LatLng(position.latitude, position.longitude),
          marker: Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(position.latitude, position.longitude),
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
}
