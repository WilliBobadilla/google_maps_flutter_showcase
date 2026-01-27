import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/features/map_example_1/data/datasource/map_example_1_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_1/data/datasource/map_selection_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_1/data/repositories/map_example_1_repository_impl.dart';
import 'package:google_maps_showcase/features/map_example_1/data/repositories/map_selection_repository_impl.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_example_1_repository.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/repositories/map_selection_repository.dart';
import 'package:google_maps_showcase/features/map_example_1/domain/usecase/get_current_location_use_case.dart';
import 'package:google_maps_showcase/features/map_example_2/data/datasource/map_example_2_remote_source.dart';
import 'package:google_maps_showcase/features/map_example_2/data/repositories/map_example_2_repository_impl.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/repositories/map_example_2_repository.dart';
import 'package:google_maps_showcase/features/map_example_2/domain/usecase/get_directions_use_case.dart';

Future<void> init() async {
  final sl = GetIt.instance;
  //Datasources
  sl.registerLazySingleton<MapExample2RemoteSource>(
    () => MapExample2RemoteSourceImpl(client: sl()),
  );

  //Repositories
  sl.registerLazySingleton<MapExample2Repository>(
    () => MapExample2RepositoryImpl(remoteSource: sl()),
  );

  //UseCases
  sl.registerLazySingleton<GetDirectionsUseCase>(
    () => GetDirectionsUseCase(mapSelectionRepository: sl()),
  );
}
