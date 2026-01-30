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
  final List<Polyline>? polylines;
  final String? routeDuration;
  final Circle? circle;
  final List<Marker>? waypoints;

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
    this.polylines,
    this.routeDuration,
    this.circle,
    this.waypoints,
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
    List<Polyline>? polylines,
    String? routeDuration,
    Circle? circle,
    List<Marker>? waypoints,
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
      polylines: polylines ?? this.polylines,
      routeDuration: routeDuration ?? this.routeDuration,
      circle: circle ?? this.circle,
      waypoints: waypoints ?? this.waypoints,
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
    polylines,
    routeDuration,
    circle,
    waypoints,
  ];
}

final class Maps2FormInitial extends Maps2FormState {}
