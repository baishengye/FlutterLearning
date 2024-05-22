import 'package:dio/dio.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, handler) async {
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    return super.onResponse(response, handler);
  }
}
