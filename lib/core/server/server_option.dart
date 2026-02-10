class ServerOption {
  String? method;
  Duration? sendTimeout;
  Duration? receiveTimeout;
  Map<String, Object>? extra;
  Map<String, Object>? headers;
  bool? preserveHeaderCase;
  String? contentType;
  bool? receiveDataWhenStatusError;
  bool? followRedirects;
  int? maxRedirect;
  bool? persistentConnection;

  ServerOption({
    this.method,
    this.sendTimeout,
    this.receiveTimeout,
    this.extra,
    this.headers,
    this.preserveHeaderCase,
    this.contentType,
    this.receiveDataWhenStatusError,
    this.followRedirects,
    this.maxRedirect,
    this.persistentConnection,
  });
}
