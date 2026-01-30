import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

part 'guess_the_location_form_state.dart';

class GuessTheLocationFormCubit extends Cubit<GuessTheLocationFormState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  GuessTheLocationFormCubit({
    required GetCurrentLocationUseCase getCurrentLocationUseCase,
  }) : _getCurrentLocationUseCase = getCurrentLocationUseCase,
       super(GuessTheLocationFormInitial());

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
        currentLocationmarker: Marker(
          markerId: const MarkerId('current_location'),
          draggable: true,
          onDragEnd: (value) {
            emit(
              state.copyWith(
                currentLocationmarker: state.currentLocationmarker!.copyWith(
                  positionParam: value,
                ),
              ),
            );
          },
          position: LatLng(
            initialPosition!.latitude,
            initialPosition.longitude,
          ),
          infoWindow: const InfoWindow(title: 'Current location'),
        ),
      ),
    );
  }

  void onLoadTargetPosition(LatLng position) {
    emit(state.copyWith(targetPosition: position));
  }

  void onClearAll() {
    developer.log("clearing all guessed data...");
    emit(
      state.copyWith(
        distanceInMeters: null,
        isCorrect: GuessLocationStatusEnum.initial,
      ),
    );
  }

  void onCheckGuessedPosition() {
    //this can be in a utils file and then use it in the data layer
    developer.log("checking guessed position...");
    developer.log('Target Position: ${state.targetPosition}');
    developer.log('Guessed Position: ${state.currentLocationmarker?.position}');
    double distanceInMeters = Geolocator.distanceBetween(
      state.targetPosition!.latitude,
      state.targetPosition!.longitude,
      state.currentLocationmarker!.position.latitude,
      state.currentLocationmarker!.position.longitude,
    );
    developer.log(
      'Distance between target and guessed: $distanceInMeters meters',
    );
    if (distanceInMeters <= 300) {
      // this can be setup in another config file
      emit(
        state.copyWith(
          distanceInMeters: distanceInMeters,
          isCorrect: GuessLocationStatusEnum.correct,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        distanceInMeters: distanceInMeters,
        isCorrect: GuessLocationStatusEnum.incorrect,
      ),
    );
  }

  void onChangeMarkerPosition(LatLng position) {
    emit(
      state.copyWith(
        currentLocationmarker: state.currentLocationmarker!.copyWith(
          positionParam: position,
        ),
      ),
    );
  }
}
