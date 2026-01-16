import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/core/cubits/location_cubit/location_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LocationCubit());
}
