import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/utils/location_utils.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  void onRequestLocationPermission() async {
    final permission = await LocationUtils.requestLocationPermission();
    emit(
      state.copyWith(
        status: permission,
        isPermissionGranted:
            permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse,
      ),
    );
  }

  void onGetCurrentLocation() async {
    final location = await LocationUtils.getCurrentLocation();
    emit(state.copyWith(currentLocation: location));
  }
}
