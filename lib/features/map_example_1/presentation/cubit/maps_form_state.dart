part of 'maps_form_cubit.dart';

class MapsFormState extends Equatable {
  final LatLng? selectedPosition;
  final Marker? marker;
  final String? errorMessage;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;

  const MapsFormState({
    this.selectedPosition,
    this.errorMessage,
    this.marker,
    this.controller,
    this.initialCameraPosition,
  });

  MapsFormState copyWith({
    LatLng? selectedPosition,
    String? errorMessage,
    Marker? marker,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
  }) {
    return MapsFormState(
      selectedPosition: selectedPosition ?? this.selectedPosition,
      errorMessage: errorMessage ?? this.errorMessage,
      marker: marker ?? this.marker,
      controller: controller ?? this.controller,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
    );
  }

  @override
  List<Object> get props => [
    selectedPosition!,
    errorMessage!,
    marker!,
    controller!,
    initialCameraPosition!,
  ];
}

class MapsFormInitial extends MapsFormState {}
