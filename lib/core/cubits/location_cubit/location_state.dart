part of 'location_cubit.dart';

class LocationState extends Equatable {
  final LocationPermission status;
  final Position? currentLocation;
  final bool? isServiceEnabled;
  final bool? isPermissionGranted;
  final Failure? failure;

  const LocationState({
    this.status = LocationPermission.denied,
    this.currentLocation,
    this.isServiceEnabled,
    this.isPermissionGranted,
    this.failure,
  });

  LocationState copyWith({
    LocationPermission? status,
    Position? currentLocation,
    bool? isServiceEnabled,
    bool? isPermissionGranted,
    Failure? failure,
  }) => LocationState(
    status: status ?? this.status,
    currentLocation: currentLocation ?? this.currentLocation,
    isServiceEnabled: isServiceEnabled ?? this.isServiceEnabled,
    isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
    failure: failure ?? this.failure,
  );

  @override
  List<Object?> get props => [
    status,
    currentLocation,
    isServiceEnabled,
    isPermissionGranted,
    failure,
  ];
}

class LocationInitial extends LocationState {}
