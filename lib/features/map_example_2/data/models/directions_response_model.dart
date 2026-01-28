import 'package:json_annotation/json_annotation.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/entities/directions_response_entity.dart';

part 'directions_response_model.g.dart';

@JsonSerializable()
class DirectionsResponseModel extends DirectionsResponseEntity {
  final List<DirectionsRouteModel>? routes;

  DirectionsResponseModel({super.status, this.routes}) : super(routes: routes);

  factory DirectionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsResponseModelToJson(this);
}

@JsonSerializable()
class DirectionsRouteModel extends DirectionsRouteEntity {
  final DirectionsPolylineModel? overviewPolyline;
  final List<DirectionsLegModel>? legs;

  DirectionsRouteModel({this.overviewPolyline, this.legs})
    : super(overviewPolyline: overviewPolyline, legs: legs);

  factory DirectionsRouteModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsRouteModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsRouteModelToJson(this);
}

@JsonSerializable()
class DirectionsPolylineModel extends DirectionsPolylineEntity {
  //final String points;

  DirectionsPolylineModel({super.points});

  factory DirectionsPolylineModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsPolylineModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsPolylineModelToJson(this);
}

@JsonSerializable()
class DirectionsLegModel extends DirectionsLegEntity {
  final DirectionsValueModel? distance;
  final DirectionsValueModel? duration;
  final String? startAddress;
  final String? endAddress;
  final List<DirectionsStepModel>? steps;

  DirectionsLegModel({
    this.distance,
    this.duration,
    this.startAddress,
    this.endAddress,
    this.steps,
  }) : super(
         distance: distance,
         duration: duration,
         startAddress: startAddress,
         endAddress: endAddress,
         steps: steps,
       );

  factory DirectionsLegModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsLegModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsLegModelToJson(this);
}

@JsonSerializable()
class DirectionsValueModel extends DirectionsValueEntity {
  DirectionsValueModel({super.text, super.value});

  factory DirectionsValueModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsValueModelToJson(this);
}

@JsonSerializable()
class DirectionsStepModel extends DirectionsStepEntity {
  final DirectionsValueModel? distance;
  final DirectionsValueModel? duration;
  final String? htmlInstructions;
  final DirectionsPolylineModel? polyline;
  final String? travelMode;

  DirectionsStepModel({
    this.distance,
    this.duration,
    this.htmlInstructions,
    this.polyline,
    this.travelMode,
  }) : super(
         distance: distance,
         duration: duration,
         htmlInstructions: htmlInstructions,
         polyline: polyline,
         travelMode: travelMode,
       );

  factory DirectionsStepModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionsStepModelFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsStepModelToJson(this);
}
