part of 'guess_the_location_form_cubit.dart';

class GuessTheLocationFormState extends Equatable {
  final LatLng? targetPosition;
  final LatLng? guessedPosition;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;
  final Marker? currentLocationmarker;

  final Failure? failure;

  const GuessTheLocationFormState({
    this.targetPosition,
    this.guessedPosition,
    this.failure,
    this.controller,
    this.initialCameraPosition,
    this.currentLocationmarker,
  });

  GuessTheLocationFormState copyWith({
    LatLng? targetPosition,
    LatLng? guessedPosition,
    Failure? failure,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
    Marker? currentLocationmarker,
  }) {
    return GuessTheLocationFormState(
      targetPosition: targetPosition ?? this.targetPosition,
      guessedPosition: guessedPosition ?? this.guessedPosition,
      failure: failure ?? this.failure,
      controller: controller ?? this.controller,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
      currentLocationmarker:
          currentLocationmarker ?? this.currentLocationmarker,
    );
  }

  @override
  List<Object?> get props => [
    targetPosition,
    guessedPosition,
    failure,
    controller,
    initialCameraPosition,
    currentLocationmarker,
  ];
}

class GuessTheLocationFormInitial extends GuessTheLocationFormState {}
