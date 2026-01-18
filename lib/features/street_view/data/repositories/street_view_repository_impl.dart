import '../datasource/street_view_remote_source.dart';
import '../../domain/repositories/street_view_repository.dart';

class StreetViewRepositoryImpl implements StreetViewRepository{

final StreetViewRemoteSource remoteSource;

StreetViewRepositoryImpl({required this.remoteSource});


}