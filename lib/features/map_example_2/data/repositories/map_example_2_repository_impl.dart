import '../datasource/map_example_2_remote_source.dart';
import '../../domain/repositories/map_example_2_repository.dart';

class MapExample2RepositoryImpl implements MapExample2Repository{

final MapExample2RemoteSource remoteSource;

MapExample2RepositoryImpl({required this.remoteSource});


}