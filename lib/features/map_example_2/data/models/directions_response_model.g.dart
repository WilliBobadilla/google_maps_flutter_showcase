// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectionsResponseModel _$DirectionsResponseModelFromJson(
  Map<String, dynamic> json,
) => DirectionsResponseModel(
  status: json['status'] as String?,
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => DirectionsRouteModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DirectionsResponseModelToJson(
  DirectionsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'routes': instance.routes};

DirectionsRouteModel _$DirectionsRouteModelFromJson(
  Map<String, dynamic> json,
) => DirectionsRouteModel(
  overviewPolyline: json['overview_polyline'] == null
      ? null
      : DirectionsPolylineModel.fromJson(
          json['overview_polyline'] as Map<String, dynamic>,
        ),
  legs: (json['legs'] as List<dynamic>?)
      ?.map((e) => DirectionsLegModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DirectionsRouteModelToJson(
  DirectionsRouteModel instance,
) => <String, dynamic>{
  'overview_polyline': instance.overviewPolyline,
  'legs': instance.legs,
};

DirectionsPolylineModel _$DirectionsPolylineModelFromJson(
  Map<String, dynamic> json,
) => DirectionsPolylineModel(points: json['points'] as String?);

Map<String, dynamic> _$DirectionsPolylineModelToJson(
  DirectionsPolylineModel instance,
) => <String, dynamic>{'points': instance.points};

DirectionsLegModel _$DirectionsLegModelFromJson(
  Map<String, dynamic> json,
) => DirectionsLegModel(
  distance: json['distance'] == null
      ? null
      : DirectionsValueModel.fromJson(json['distance'] as Map<String, dynamic>),
  duration: json['duration'] == null
      ? null
      : DirectionsValueModel.fromJson(json['duration'] as Map<String, dynamic>),
  startAddress: json['start_address'] as String?,
  endAddress: json['end_address'] as String?,
  steps: (json['steps'] as List<dynamic>?)
      ?.map((e) => DirectionsStepModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DirectionsLegModelToJson(DirectionsLegModel instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'steps': instance.steps,
    };

DirectionsValueModel _$DirectionsValueModelFromJson(
  Map<String, dynamic> json,
) => DirectionsValueModel(
  text: json['text'] as String?,
  value: (json['value'] as num?)?.toInt(),
);

Map<String, dynamic> _$DirectionsValueModelToJson(
  DirectionsValueModel instance,
) => <String, dynamic>{'text': instance.text, 'value': instance.value};

DirectionsStepModel _$DirectionsStepModelFromJson(
  Map<String, dynamic> json,
) => DirectionsStepModel(
  distance: json['distance'] == null
      ? null
      : DirectionsValueModel.fromJson(json['distance'] as Map<String, dynamic>),
  duration: json['duration'] == null
      ? null
      : DirectionsValueModel.fromJson(json['duration'] as Map<String, dynamic>),
  htmlInstructions: json['html_instructions'] as String?,
  polyline: json['polyline'] == null
      ? null
      : DirectionsPolylineModel.fromJson(
          json['polyline'] as Map<String, dynamic>,
        ),
  travelMode: json['travelMode'] as String?,
);

Map<String, dynamic> _$DirectionsStepModelToJson(
  DirectionsStepModel instance,
) => <String, dynamic>{
  'distance': instance.distance,
  'duration': instance.duration,
  'html_instructions': instance.htmlInstructions,
  'polyline': instance.polyline,
  'travelMode': instance.travelMode,
};
