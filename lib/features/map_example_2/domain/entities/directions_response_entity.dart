class DirectionsResponseEntity {
  final String? status;
  final List<DirectionsRouteEntity>? routes;

  DirectionsResponseEntity({this.status, this.routes});
}

class DirectionsRouteEntity {
  final DirectionsPolylineEntity? overviewPolyline;
  final List<DirectionsLegEntity>? legs;

  DirectionsRouteEntity({this.overviewPolyline, this.legs});
}

class DirectionsPolylineEntity {
  final String? points;

  DirectionsPolylineEntity({this.points});
}

class DirectionsLegEntity {
  final DirectionsValueEntity? distance;
  final DirectionsValueEntity? duration;
  final String? startAddress;
  final String? endAddress;
  final List<DirectionsStepEntity>? steps;

  DirectionsLegEntity({
    this.distance,
    this.duration,
    this.startAddress,
    this.endAddress,
    this.steps,
  });
}

class DirectionsValueEntity {
  final String? text;
  final int? value;

  DirectionsValueEntity({this.text, this.value});
}

class DirectionsStepEntity {
  final DirectionsValueEntity? distance;
  final DirectionsValueEntity? duration;
  final String? htmlInstructions;
  final DirectionsPolylineEntity? polyline;
  final String? travelMode;

  DirectionsStepEntity({
    this.distance,
    this.duration,
    this.htmlInstructions,
    this.polyline,
    this.travelMode,
  });
}
