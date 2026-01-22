import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:google_maps_showcase/core/errors/failures.dart';
import 'package:google_maps_showcase/core/constants_values/links.dart';

class ExternalClient {
  final http.Client? client;
  final bool logTraffic;

  ExternalClient({this.client, this.logTraffic = true});

  http.Client get httpClient => client ?? http.Client();

  void _log(String tag, dynamic text) {
    if (logTraffic) {
      developer.log(
        '[LOG_HTTP] ${tag.padRight(14, '-')}> $text',
        name: 'google_showcase',
      );
    }
  }

  Future<dynamic> get(
    String path, [
    Map<String, String>? additionalHeaders,
    String? endpoint,
  ]) async {
    String url = Links.kBaseUrl + path;
    Map<String, String> headers = {};
    developer.log('URL: $url', name: 'google');
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    _log('Header', headers);
    _log('GET', path);
    try {
      final http.Response response = await client!.get(
        Uri.parse(url),
        headers: headers,
      );
      return _parseResponse(response, endpoint);
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  dynamic _parseResponse(http.Response response, String? endpoint) {
    _log('Response', 'Status Code: ${response.statusCode}');
    _log('Response', 'Body: ${response.body}');

    switch (response.statusCode) {
      case 200:
        var jsonDecode = json.decode(response.body);
        return jsonDecode;

      default:
        throw ServerFailure(
          message: 'Server Error: ${response.statusCode} - ${response.body}',
          //endpoint: endpoint,
        );
    }
  }
}
