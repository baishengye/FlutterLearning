
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:xiaomishop/app/data/focus_bean.dart';
import 'package:xiaomishop/app/utils/network/http/http_config.dart';

part 'xiaomi_shop_api.g.dart';

@RestApi(baseUrl: HttpConfig.itYinBaseUrl)
abstract class XiaomiShopApi{
  factory XiaomiShopApi(Dio dio, {String baseUrl}) = _XiaomiShopApi;

  @GET('/api/focus')
  Future<FocusBean> getFocusList();
}