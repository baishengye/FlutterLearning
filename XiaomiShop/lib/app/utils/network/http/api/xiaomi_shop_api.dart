
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:xiaomishop/app/utils/network/http/http_config.dart';

import '../../../../data/carousel_image_entity.dart';
import '../../../../data/jin_gang_district_entity.dart';

part 'xiaomi_shop_api.g.dart';

@RestApi(baseUrl: HttpConfig.itYinBaseUrl)
abstract class XiaomiShopApi{
  factory XiaomiShopApi(Dio dio, {String baseUrl}) = _XiaomiShopApi;

  @GET('/api/focus')
  Future<CarouselImageEntity> getCarouselImage(
    {@Query("position") int position = 1}
  );

  @GET('/api/bestCate')
  Future<JinGangDistrictEntity> getJinGangDistrict();
}