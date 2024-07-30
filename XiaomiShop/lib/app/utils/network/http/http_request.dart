import 'package:xiaomishop/app/utils/network/http/api/xiaomi_shop_api.dart';
import 'package:xiaomishop/app/utils/network/http/dio_client.dart';
import 'package:xiaomishop/app/utils/network/http/http_config.dart';

class HttpRequestUtil{
  static late final XiaomiShopApi xiaomiShopApi;

  static void init(){
    var dioClient = DioClient();
    dioClient.init(baseUrl: HttpConfig.itYinBaseUrl);

    xiaomiShopApi = XiaomiShopApi(dioClient.dio);
  }

  static String replaceUrl(picUrl) {
    String tempUrl = "${HttpConfig.itYinBaseUrl}/$picUrl";
    return tempUrl.replaceAll("\\", "/");
  }
}