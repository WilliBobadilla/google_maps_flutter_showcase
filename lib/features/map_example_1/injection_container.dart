import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/features/map_example_1/data/datasource/map_example_1_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_1/data/datasource/map_selection_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_1/data/repositories/map_example_1_repository_impl.dart';
import 'package:google_maps_showcase/features/map_example_1/data/repositories/map_selection_repository_impl.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_example_1_repository.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_selection_repository.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';

Future<void> init() async {
  final sl = GetIt.instance;
  //Datasources
  sl.registerLazySingleton<MapExample1RemoteSource>(
    () => MapExample1RemoteSourceImpl(),
  );

  sl.registerLazySingleton<MapSelectionRemoteSource>(
    () => MapSelectionRemoteSourceImpl(),
  );

  //Repositories
  sl.registerLazySingleton<MapExample1Repository>(
    () => MapExample1RepositoryImpl(remoteSource: sl()),
  );

  sl.registerLazySingleton<MapSelectionRepository>(
    () => MapSelectionRepositoryImpl(remoteSource: sl()),
  );

  //UseCases
  sl.registerLazySingleton<GetCurrentLocationUseCase>(
    () => GetCurrentLocationUseCase(mapSelectionRepository: sl()),
  );
}
