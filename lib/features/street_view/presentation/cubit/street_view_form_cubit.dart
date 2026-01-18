import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';

part 'street_view_form_state.dart';

class StreetViewFormCubit extends Cubit<StreetViewFormState> {
  StreetViewFormCubit() : super(StreetViewFormInitial());

  void onLocationChanged(LatLng location) {
    emit(state.copyWith(location: location));
  }
}
