part of 'street_view_form_cubit.dart';

class StreetViewFormState extends Equatable {
  final LatLng? location;
  final Failure? failure;
  final String? htmlForStreetView;

  const StreetViewFormState({
    this.location,
    this.failure,
    this.htmlForStreetView,
  });

  StreetViewFormState copyWith({
    LatLng? location,
    Failure? failure,
    String? htmlForStreetView,
  }) {
    return StreetViewFormState(
      location: location ?? this.location,
      failure: failure ?? this.failure,
      htmlForStreetView: htmlForStreetView ?? this.htmlForStreetView,
    );
  }

  @override
  List<Object?> get props => [location, failure, htmlForStreetView];
}

class StreetViewFormInitial extends StreetViewFormState {}
