import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/json_mapper.dart';
import '../encryption_utils.dart';
import 'api_response.dart';

class ComicHttpClient {
  ComicHttpClient({
    required String authority,
    required String basePath,
    required String publicKey,
    required String privateKey,
    http.Client? client,
  })  : _authority = authority,
        _basePath = basePath,
        _publicKey = publicKey,
        _privateKey = privateKey,
        _client = client ?? http.Client();

  final String _authority;
  final String _basePath;
  final String _publicKey;
  final String _privateKey;
  final http.Client _client;

  Future<ApiResponse<T>> get<T>(
    String path, {
    JsonResponseMapper<T>? responseMapper,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Map<String, String> requestQueryParams =
        _buildQueryParams(queryParams);
    final uri = Uri.https(_authority, '$_basePath$path', requestQueryParams);

    try {
      final response = await _client.get(uri, headers: headers);
      return _mapResponse<T>(response, responseMapper);
    } catch (exception) {
      //TODO: log Exception
      return ApiResponse<T>.error(exception.toString());
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    required JsonResponseMapper<T> responseMapper,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Map<String, String> requestQueryParams =
        _buildQueryParams(queryParams);
    final uri = Uri.https(_basePath, path, requestQueryParams);

    final postHeaders = {'Content-type': 'application/json'};
    if (headers != null) postHeaders.addAll(headers);

    try {
      final response = await _client.post(uri, headers: headers);
      return _mapResponse<T>(response, responseMapper);
    } catch (exception) {
      //TODO: log Exception
      return ApiResponse<T>.error(exception.toString());
    }
  }

  Map<String, String> _buildQueryParams(
    Map<String, String>? queryParams,
  ) {
    final Map<String, String> requestQueryParams = {};
    requestQueryParams.addAll(_authParams);
    if (queryParams != null) requestQueryParams.addAll(queryParams);
    return requestQueryParams;
  }

  ApiResponse<T> _mapResponse<T>(
    http.Response response,
    JsonResponseMapper<T>? responseMapper,
  ) {
    final responseMap = json.decode(response.body);
    if (responseMap is! Map<String, dynamic>) {
      //TODO: log error unexpected response type
      return ApiResponse<T>.error('Unexpected ');
    }

    return ApiResponse<T>.fromHttpResponse(
      response: response,
      responseMapper: responseMapper,
    );
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
