import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../../../data/carousel_image_entity.dart';
import '../../../data/hot_selling_good_entity.dart';
import '../../../data/category_entity.dart';
import '../../../utils/network/http/http_request.dart';

class HomeController extends GetxController {
  final ScrollController listViewScrollController = ScrollController();
  final RxBool appBarStatus = false.obs;

  //轮播图数据
  final RxList<CarouselImageResult> carouselImageList =
      <CarouselImageResult>[].obs;

  // 金刚区功能数据
  final RxList<CategoryResult> jinGangDistrictList = <CategoryResult>[].obs;

  // 热销甄选轮播图
  final RxList<CarouselImageResult> bestSellingCarouselImageList =
      <CarouselImageResult>[].obs;

  // 获取热销臻选里面的商品数据
  final RxList<HotSellingGoodResult> bastSellingGoodList =
      <HotSellingGoodResult>[].obs;

  // 热门商品
  final RxList<HotSellingGoodResult> sellingGoodList =
      <HotSellingGoodResult>[].obs;

  @override
  void onInit() {
    super.onInit();

    listViewScrollController.addListener(() {
      if (listViewScrollController.position.pixels <= 10.height &&
          appBarStatus.value == true) {
        appBarStatus.value = false;
        update();
      } else if (listViewScrollController.position.pixels > 10.height &&
          appBarStatus.value == false) {
        appBarStatus.value = true;
        update();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _getCarouselImageList();
    _getJinGangDistrictList();
    _getBestSellingCarouselImageList();
    _getBestSellingGoodList();
    _getSellingGoodList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //获取轮播图
  void _getCarouselImageList() {
    HttpRequestUtil.xiaomiShopApi.getCarouselImage().then((value) {
      carouselImageList.value = value.result;
      update();
    });
  }

  // 获取热销甄选轮播图
  void _getBestSellingCarouselImageList() {
    HttpRequestUtil.xiaomiShopApi.getCarouselImage(position: 2).then((value) {
      bestSellingCarouselImageList.value = value.result;
      update();
    });
  }

  void _getJinGangDistrictList() {
    HttpRequestUtil.xiaomiShopApi.getJinGangDistrict().then((value) {
      jinGangDistrictList.value = value.result;
      update();
    });
  }

  void _getBestSellingGoodList() {
    HttpRequestUtil.xiaomiShopApi
        .getHotSellingGood(isHot: 1, pageSize: 3)
        .then((value) {
      bastSellingGoodList.value = value.result;
      update();
    });
  }

  void _getSellingGoodList() {
    HttpRequestUtil.xiaomiShopApi.getHotSellingGood(isBest: 1).then((value) {
      sellingGoodList.value = value.result;
      update();
    });
  }
}
