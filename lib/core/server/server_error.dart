// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerError implements Exception {
  final int? statusCode;
  final dynamic data;
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;
  final dynamic requestOption;
  final dynamic response;
  final dynamic type;

  ServerError({
    required this.statusCode,
    this.data,
    required this.message,
    this.stackTrace,
    this.error,
    this.requestOption,
    this.response,
    this.type,
  });

  @override
  String toString() {
    return 'ServerError(statusCode: $statusCode, data: $data, message: $message, error: $error, stackTrace: $stackTrace, requestOption: $requestOption, response: $response, type: $type)';
  }
}
