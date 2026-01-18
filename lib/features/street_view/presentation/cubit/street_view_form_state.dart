part of 'street_view_form_cubit.dart';

class StreetViewFormState extends Equatable {
  final LatLng? location;
  final Failure? failure;

  const StreetViewFormState({this.location, this.failure});

  StreetViewFormState copyWith({LatLng? location, Failure? failure}) {
    return StreetViewFormState(
      location: location ?? this.location,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [location, failure];
}

class StreetViewFormInitial extends StreetViewFormState {}
