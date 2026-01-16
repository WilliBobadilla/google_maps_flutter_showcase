part of 'maps_form_cubit.dart';

class MapsFormState extends Equatable {
  final LatLng? selectedPosition;
  final Marker? marker;
  final String? errorMessage;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;
  final double? lastRotation;

  const MapsFormState({
    this.selectedPosition,
    this.errorMessage,
    this.marker,
    this.controller,
    this.initialCameraPosition,
    this.lastRotation,
  });

  MapsFormState copyWith({
    LatLng? selectedPosition,
    String? errorMessage,
    Marker? marker,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
    double? lastRotation,
  }) {
    return MapsFormState(
      selectedPosition: selectedPosition ?? this.selectedPosition,
      errorMessage: errorMessage ?? this.errorMessage,
      marker: marker ?? this.marker,
      controller: controller ?? this.controller,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
      lastRotation: lastRotation ?? this.lastRotation,
    );
  }

  @override
  List<Object> get props => [
    selectedPosition!,
    errorMessage!,
    marker!,
    controller!,
    initialCameraPosition!,
    lastRotation!,
  ];
}

class MapsFormInitial extends MapsFormState {}
