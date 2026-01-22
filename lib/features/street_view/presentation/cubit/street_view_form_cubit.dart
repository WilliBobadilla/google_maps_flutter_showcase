import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/features/street_view/domain/usecase/get_random_place_use_case.dart';

part 'street_view_form_state.dart';

class StreetViewFormCubit extends Cubit<StreetViewFormState> {
  final GetRandomPlaceForStreetViewUseCase _getRandomPlaceForStreetViewUseCase;

  StreetViewFormCubit({
    required GetRandomPlaceForStreetViewUseCase
    getRandomPlaceForStreetViewUseCase,
  }) : _getRandomPlaceForStreetViewUseCase = getRandomPlaceForStreetViewUseCase,
       super(StreetViewFormInitial());

  void onLocationChanged(LatLng location) {
    emit(state.copyWith(location: location));
  }

  void onGetRandomLocation() async {
    final result = await _getRandomPlaceForStreetViewUseCase.call(NoParams());
    developer.log("random location result: $result");
    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (place) => emit(state.copyWith(location: place)),
    );
  }
}
