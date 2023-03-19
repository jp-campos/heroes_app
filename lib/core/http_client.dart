import 'dart:convert';

import 'package:http/http.dart' as http;

import 'encryption_utils.dart';

class ComicHttpClient {
  ComicHttpClient({
    required String basePath,
    required String publicKey,
    required String privateKey,
  })  : _basePath = basePath,
        _publicKey = publicKey,
        _privateKey = privateKey;

  final String _basePath;
  final String _publicKey;
  final String _privateKey;

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? params,
  }) async {
    final Map<String, String> queryParams = {};
    queryParams.addAll(_authParams);

    if (params != null) queryParams.addAll(params);

    final uri =
        Uri.parse('$_basePath$path').replace(queryParameters: queryParams);
    final response = await http.get(uri);
    return json.decode(response.body);
  }

  Map<String, String> get _authParams {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    return {
      'apikey': _publicKey,
      'hash': buildHash(
        privateKey: _privateKey,
        publicKey: _publicKey,
        timeStamp: timeStamp,
      ),
      'ts': timeStamp.toString()
    };
  }
}
