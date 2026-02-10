import 'package:tcc_gym_admin_front/core/server/server_option.dart';
import 'package:tcc_gym_admin_front/core/server/server_response.dart';

abstract class IServer {
  Future<ServerResponse> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });

  Future<ServerResponse> post(
    String path, {
    dynamic data,
    ServerOption? options,
  });

  Future<ServerResponse> put(String path, {dynamic data});

  Future<ServerResponse> delete(String path, {Object data});
}
