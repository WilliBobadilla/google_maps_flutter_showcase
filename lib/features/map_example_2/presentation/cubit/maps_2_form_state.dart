part of 'maps_2_form_cubit.dart';

class Maps2FormState extends Equatable {
  final LatLng? selectedPosition;
  final Marker? currentLocationmarker;
  final Marker? destinationLocationmarker;
  final int? zindexDestinationMarker;
  final String? errorMessage;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;
  final double? lastRotation;
  final FormzSubmissionStatus status;
  final DirectionsResponseEntity? directions;
  final Polyline? polyline;

  const Maps2FormState({
    this.selectedPosition,
    this.errorMessage,
    this.currentLocationmarker,
    this.destinationLocationmarker,
    this.zindexDestinationMarker,
    this.controller,
    this.initialCameraPosition,
    this.lastRotation,
    this.status = FormzSubmissionStatus.initial,
    this.directions,
    this.polyline,
  });

  Maps2FormState copyWith({
    LatLng? selectedPosition,
    String? errorMessage,
    Marker? curentLocationMarker,
    Marker? destinationLocationMarker,
    int? zindexDestinationMarker,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
    double? lastRotation,
    FormzSubmissionStatus? status,
    DirectionsResponseEntity? directions,
    Polyline? polyline,
  }) {
    return Maps2FormState(
      selectedPosition: selectedPosition ?? this.selectedPosition,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLocationmarker: curentLocationMarker ?? this.currentLocationmarker,
      destinationLocationmarker:
          destinationLocationMarker ?? this.destinationLocationmarker,
      zindexDestinationMarker:
          zindexDestinationMarker ?? this.zindexDestinationMarker,
      controller: controller ?? this.controller,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
      lastRotation: lastRotation ?? this.lastRotation,
      status: status ?? this.status,
      directions: directions ?? this.directions,
      polyline: polyline ?? this.polyline,
    );
  }

  @override
  List<Object?> get props => [
    selectedPosition,
    errorMessage,
    currentLocationmarker,
    destinationLocationmarker,
    zindexDestinationMarker,
    controller,
    initialCameraPosition,
    lastRotation,
    status,
    directions,
    polyline,
  ];
}

final class Maps2FormInitial extends Maps2FormState {}
