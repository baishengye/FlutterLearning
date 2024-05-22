
import 'package:dio/dio.dart';

class CookiesInterceptors extends InterceptorsWrapper {

  Map<String,String> cookies = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var cookie = cookies[options.baseUrl]??"";
    if(cookie != ""){
      options.headers.addAll({"Cookie": cookie});
    }

    super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    cookies.addAll({response.requestOptions.baseUrl:response.requestOptions.headers["Cookie"]});
    return handler.next(response);
  }
}