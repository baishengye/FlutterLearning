import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wanandroid/common/config/http_config.dart';

part 'wanandroid_api.g.dart';

@RestApi(baseUrl: HttpConfig.baseUrl)
class WanAndroidApi {
}