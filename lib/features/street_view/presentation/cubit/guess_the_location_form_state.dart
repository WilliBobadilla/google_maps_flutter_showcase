part of 'guess_the_location_form_cubit.dart';

enum GuessLocationStatusEnum { initial, correct, incorrect }

class GuessTheLocationFormState extends Equatable {
  final LatLng? targetPosition;
  final LatLng? guessedPosition;
  final GoogleMapController? controller;
  final CameraPosition? initialCameraPosition;
  final Marker? currentLocationmarker;
  final Failure? failure;
  final double? distanceInMeters;
  final GuessLocationStatusEnum isCorrect;

  const GuessTheLocationFormState({
    this.targetPosition,
    this.guessedPosition,
    this.failure,
    this.controller,
    this.initialCameraPosition,
    this.currentLocationmarker,
    this.distanceInMeters,
    this.isCorrect = GuessLocationStatusEnum.initial,
  });

  GuessTheLocationFormState copyWith({
    LatLng? targetPosition,
    LatLng? guessedPosition,
    Failure? failure,
    GoogleMapController? controller,
    CameraPosition? initialCameraPosition,
    Marker? currentLocationmarker,
    double? distanceInMeters,
    GuessLocationStatusEnum? isCorrect,
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
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      isCorrect: isCorrect ?? this.isCorrect,
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
    distanceInMeters,
    isCorrect,
  ];
}

class GuessTheLocationFormInitial extends GuessTheLocationFormState {}
