import '../datasource/map_example_1_remote_source.dart';
import '../../domain/repositories/map_example_1_repository.dart';

class MapExample1RepositoryImpl implements MapExample1Repository{

final MapExample1RemoteSource remoteSource;

MapExample1RepositoryImpl({required this.remoteSource});


}