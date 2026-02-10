import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tcc_gym_admin_front/core/server/i_server.dart';
import 'package:tcc_gym_admin_front/core/server/server_error.dart';
import 'package:tcc_gym_admin_front/core/server/server_option.dart';
import 'package:tcc_gym_admin_front/core/server/server_response.dart';

class ServerDio implements IServer {
  static final ServerDio _intance = ServerDio._internal();
  factory ServerDio() => _intance;

  late Dio dio;

  ServerDio._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: Duration(minutes: 2),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log(options.path, name: 'ONREQUEST');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          return handler.next(e);
        },
      ),
    );
  }

  @override
  Future<ServerResponse> delete(String path, {Object? data}) async {
    try {
      final result = await dio.delete(path, data: data);

      final response = _handleResponse(result);
      return response;
    } on DioException catch (e) {
      throw ServerError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioException.badResponse,
        requestOption: e.requestOptions,
        message: e.message ?? '',
      );
    }
  }

  @override
  Future<ServerResponse> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      final response = _handleResponse(result);
      return response;
    } on DioException catch (e) {
      throw ServerError(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        type: DioException.badResponse,
        requestOption: e.requestOptions,
        message: e.message ?? '',
      );
    }
  }

  @override
  Future<ServerResponse> post(
    String path, {
    data,
    ServerOption? options,
  }) async {
    try {
      final result = await dio.post(
        path,
        options: serveOptionToDioOption(options),
        data: data,
      );

      final response = _handleResponse(result);
      return response;
    } on DioException catch (e) {
      throw ServerError(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        type: DioException.badResponse,
        requestOption: e.requestOptions,
        message: e.message ?? '',
      );
    }
  }

  @override
  Future<ServerResponse> put(String path, {dynamic data}) async {
    try {
      final result = await dio.put(path, data: data);

      final response = _handleResponse(result);
      return response;
    } on DioException catch (e) {
      throw ServerError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioException.badResponse,
        requestOption: e.requestOptions,
        message: e.message ?? '',
      );
    }
  }

  Options? serveOptionToDioOption(ServerOption? options) {
    if (options == null) {
      return null;
    }

    return Options(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      extra: options.extra,
      headers: options.headers,
      contentType: options.contentType,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirect,
      persistentConnection: options.persistentConnection,
      preserveHeaderCase: options.preserveHeaderCase,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
    );
  }

  ServerResponse _handleResponse(Response response) {
    return ServerResponse(
      data: (response.data is String && response.data.isNotEmpty)
          ? json.decode(response.data)
          : response.data,

      statusCode: StatusCodeEnum.fromStatusCode(response.statusCode),
    );
  }
}
