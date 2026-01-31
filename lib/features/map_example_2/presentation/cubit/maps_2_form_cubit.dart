import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_showcase/core/constants_values/assets.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_showcase/core/usecases/usecase.dart';
import 'package:google_maps_showcase/core/utils/polyline_utils.dart';
import 'package:google_maps_showcase/core/utils/custom_icon_maps_utils.dart';
import 'package:google_maps_showcase/core/utils/fit_route_to_camera_util.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/usecase/get_directions_use_case.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';
import 'package:google_maps_showcase/features/map_example_2/presentation/widget/map_marker_dash_widget.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_request_entity.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

part 'maps_2_form_state.dart';

class Maps2FormCubit extends Cubit<Maps2FormState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final GetDirectionsUseCase _getDirectionsUseCase;

  Maps2FormCubit({
    required GetCurrentLocationUseCase getCurrentLocationUseCase,
    required GetDirectionsUseCase getDirectionsUseCase,
  }) : _getCurrentLocationUseCase = getCurrentLocationUseCase,
       _getDirectionsUseCase = getDirectionsUseCase,
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
        CameraUpdate.newCameraPosition(
          CameraPosition(target: initialPosition, zoom: 15),
        ),
      );
    }

    emit(
      state.copyWith(
        controller: controller,
        circle: Circle(
          circleId: const CircleId('circle'),
          center: initialPosition ?? LatLng(0, 0),
          radius: 100,
          strokeWidth: 2,
          strokeColor: const Color.fromARGB(255, 83, 196, 63),
          fillColor: const Color.fromARGB(255, 125, 148, 168).withAlpha(70),
        ),
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
          onDragEnd: (value) {
            developer.log("dragging the destination marker, finished");
            emit(
              state.copyWith(
                zindexDestinationMarker: 0,
                destinationLocationMarker: state.destinationLocationmarker!
                    .copyWith(positionParam: value),
              ),
            );
          },
          position: LatLng(
            initialPosition!.latitude + 0.01,
            initialPosition.longitude + 0.01,
          ),
          infoWindow: const InfoWindow(title: 'Destination location'),
        ),
        curentLocationMarker: Marker(
          icon: await const MapMarkerWidget().toBitmapDescriptor(
            logicalSize: const Size(150, 150),
            imageSize: const Size(150, 150),
          ),
          markerId: const MarkerId('current_location'),
          position: LatLng(
            initialPosition!.latitude,
            initialPosition.longitude,
          ),
          infoWindow: const InfoWindow(title: 'Current location'),
        ),
      ),
    );
  }

  void onRequestDirections() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _getDirectionsUseCase.call(
      DirectionsRequestEntity(
        origin: state.currentLocationmarker!.position,
        destination: state.destinationLocationmarker!.position,
        waypoints: state.waypoints != null
            ? state.waypoints?.map((e) => e.position).toList()
            : [],
      ),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
      (success) {
        final polylinePoints = PolylineUtils.buildRoutePolyline(success);
        final routeDuration = success.routes!.first.legs!.first.duration!.text;
        if (state.controller != null) {
          final bounds = FitRouteToCameraUtil.fitCameraToPolyline(
            state.controller!,
            polylinePoints.points,
          );
          state.controller!.animateCamera(
            CameraUpdate.newLatLngBounds(bounds, 100),
          );
        }
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
            directions: success,
            polylines: [polylinePoints],
            routeDuration: routeDuration,
          ),
        );
      },
    );
  }

  void onCenterView() {
    final bounds = FitRouteToCameraUtil.fitCameraToPolyline(state.controller!, [
      state.currentLocationmarker!.position,
      state.destinationLocationmarker!.position,
    ]);
    state.controller!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
  }

  void onMapTapped(LatLng position) async {
    emit(
      state.copyWith(
        waypoints: [
          Marker(
            icon:
                await const MapMarkerWidget(
                  iconDataPath: CustomAssets.beerIcon,
                ).toBitmapDescriptor(
                  logicalSize: const Size(150, 150),
                  imageSize: const Size(150, 150),
                ),
            markerId: const MarkerId('waypoint1'),
            draggable: true,
            onDragEnd: (value) {
              developer.log("dragging the waypoint1, finished");
              emit(
                state.copyWith(
                  zindexDestinationMarker: 0,
                  waypoints: state.waypoints!
                    ..where(
                      (element) => element.markerId.value == 'waypoint1',
                    ).first.copyWith(positionParam: value),
                ),
              );
            },
            position: position,
            infoWindow: const InfoWindow(title: 'Parada obligatoria'),
          ),
        ],
      ),
    );
  }

  void onTrafficToogle() {
    emit(state.copyWith(isTrafficEnabled: !state.isTrafficEnabled));
  }
}
