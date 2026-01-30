part of 'maps_form_cubit.dart';

class MapsFormState extends Equatable {
  final LatLng? selectedPosition;
  final Marker? marker;
  final String? errorMessage;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;
  final double? lastRotation;
  final MapType? mapType;
  final int mapTypeIndex;
  final double cameraTilt;

  const MapsFormState({
    this.selectedPosition,
    this.errorMessage,
    this.marker,
    this.controller,
    this.initialCameraPosition,
    this.lastRotation,
    this.mapType = MapType.normal,
    this.mapTypeIndex = 1,
    this.cameraTilt = 0,
  });

  MapsFormState copyWith({
    LatLng? selectedPosition,
    String? errorMessage,
    Marker? marker,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
    double? lastRotation,
    MapType? mapType,
    int? mapTypeIndex,
    double? cameraTilt,
  }) {
    return MapsFormState(
      selectedPosition: selectedPosition ?? this.selectedPosition,
      errorMessage: errorMessage ?? this.errorMessage,
      marker: marker ?? this.marker,
      controller: controller ?? this.controller,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
      lastRotation: lastRotation ?? this.lastRotation,
      mapType: mapType ?? this.mapType,
      mapTypeIndex: mapTypeIndex ?? this.mapTypeIndex,
      cameraTilt: cameraTilt ?? this.cameraTilt,
    );
  }

  @override
  List<Object?> get props => [
    selectedPosition,
    errorMessage,
    marker,
    controller,
    initialCameraPosition,
    lastRotation,
    mapType,
    mapTypeIndex,
    cameraTilt,
  ];
}

class MapsFormInitial extends MapsFormState {}
