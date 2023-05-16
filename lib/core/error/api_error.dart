typedef ApiErrorMapper = ApiException Function(Map<String, dynamic> json);

class ApiException extends Error {
  final String message;
  ApiException(this.message);
}

ApiErrorMapper defaultErrorMapper =
    (Map<String, dynamic> json) => ApiException('error');
