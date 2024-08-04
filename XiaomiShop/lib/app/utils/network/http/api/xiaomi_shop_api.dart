import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xiaomishop/app/utils/network/http/http_config.dart';

import '../../../../data/carousel_image_entity.dart';
import '../../../../data/hot_selling_good_entity.dart';
import '../../../../data/category_entity.dart';

part 'xiaomi_shop_api.g.dart';

@RestApi(baseUrl: HttpConfig.itYinBaseUrl)
abstract class XiaomiShopApi {
  factory XiaomiShopApi(Dio dio, {String baseUrl}) = _XiaomiShopApi;

  @GET('/api/focus')
  Future<CarouselImageEntity> getCarouselImage(
      {@Query("position") int? position});

  @GET('/api/bestCate')
  Future<CategoryEntity> getJinGangDistrict();

  @GET('/api/plist')
  Future<HotSellingGoodEntity> getHotSellingGood(
      {@Query("is_hot") int? isHot,
      @Query("pageSize") int? pageSize,
      @Query("is_best") int? isBest});

  @GET('/api/pcate')
  Future<CategoryEntity> getAllCategory({@Query("pid") String? id});
}
