import 'package:get_it/get_it.dart';
import 'package:google_maps_showcase/core/http_client/external_client.dart';
import 'package:http/http.dart' as http;

Future<void> init() async {
  final sl = GetIt.instance;

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => ExternalClient(client: sl()));
}
