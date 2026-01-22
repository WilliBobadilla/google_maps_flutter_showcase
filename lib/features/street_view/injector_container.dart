import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/features/street_view/data/datasource/street_view_remote_source.dart';
import 'package:google_maps_showcase/features/street_view/data/repositories/street_view_repository_impl.dart';
import 'package:google_maps_showcase/features/street_view/domain/repositories/street_view_repository.dart';
import 'package:google_maps_showcase/features/street_view/domain/usecase/get_random_place_use_case.dart';

Future<void> init() async {
  final sl = GetIt.instance;

  //datasources
  sl.registerLazySingleton<StreetViewRemoteSource>(
    () => StreetViewRemoteSourceImpl(client: sl()),
  );

  //repositories

  sl.registerLazySingleton<StreetViewRepository>(
    () => StreetViewRepositoryImpl(remoteSource: sl()),
  );

  //usecases
  sl.registerLazySingleton(
    () => GetRandomPlaceForStreetViewUseCase(streetViewRepository: sl()),
  );
}
