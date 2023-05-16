import 'dart:convert';

import 'package:http/http.dart';

import '../../data/json_mapper.dart';
import '../error/api_error.dart';

class ApiResponse<R> {
  R? content;
  ApiException? error;
  late bool success;
  int? responseCode;

  bool get hasEmptyBody => success == true && content == null;

  ApiResponse({
    required this.success,
    this.content,
    this.error,
    this.responseCode,
  });

  factory ApiResponse.fromHttpResponse({
    required Response response,
    JsonResponseMapper<R>? responseMapper,
    ApiErrorMapper errorMapper = _defaultMapper,
  }) {
    final responseCode = response.statusCode;

    if (responseCode >= 200 && responseCode <= 299) {
      R? mappedBody;

      if (response.body.isNotEmpty && responseMapper != null) {
        mappedBody = responseMapper.call(jsonDecode(response.body));
      }

      return ApiResponse(
        success: true,
        content: mappedBody,
        responseCode: responseCode,
      );
    } else {
      return ApiResponse(
        success: false,
        error: errorMapper.call(jsonDecode(response.body)),
        responseCode: responseCode,
      );
    }
  }

  factory ApiResponse.error(String message) =>
      ApiResponse(success: false, error: ApiException(message));

  R getResultOrThrowError() {
    if (success) {
      return content!;
    }
    throw Exception(error!.message);
  }

  //Static wrapper to make the function const and usable as default parameter
  static ApiException _defaultMapper(Map<String, dynamic> json) =>
      defaultErrorMapper(json);
}
