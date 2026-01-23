class CityBoxEntity {
  final String name;
  final double minLat;
  final double minLng;
  final double maxLat;
  final double maxLng;

  const CityBoxEntity({
    required this.name,
    required this.minLat,
    required this.minLng,
    required this.maxLat,
    required this.maxLng,
  });
}
