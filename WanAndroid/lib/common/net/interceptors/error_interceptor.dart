import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:wanandroid/common/net/code.dart';
import 'package:wanandroid/common/net/protocol/respone_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 错误拦截
class ErrorInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, handler) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      var errorMessage = Code.errorHandleFunction(Code.NETWORK_ERROR, "", false);
      return handler.reject(DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          response: Response(
              requestOptions: options,
              data: ResultData(
                  Code.NETWORK_ERROR,
                  errorMessage,
                  data: null))));
    }
    return super.onRequest(options, handler);
  }
}
