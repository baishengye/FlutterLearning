import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/network/http/dio_client.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../../../data/carousel_image_entity.dart';
import '../../../data/jin_gang_district_entity.dart';
import '../../../utils/network/http/http_request.dart';

class HomeController extends GetxController {
  final ScrollController listViewScrollController = ScrollController();
  final RxBool appBarStatus = false.obs;

  //轮播图数据
  final RxList<CarouselImageResult> carouselImageList = <CarouselImageResult>[].obs;

  // 金刚区功能数据
  final RxList<JinGangDistrictResult> jinGangDistrictList = <JinGangDistrictResult>[].obs;

  // 热销甄选轮播图
  final RxList<CarouselImageResult> bestSellingCarouselImageList = <CarouselImageResult>[].obs;


  @override
  void onInit() {
    super.onInit();

    listViewScrollController.addListener(() {
      if(listViewScrollController.position.pixels <= 10.height &&
        appBarStatus.value == true){
        appBarStatus.value = false;
        update();
      }else if(listViewScrollController.position.pixels > 10.height &&
        appBarStatus.value == false){
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  //获取轮播图
  void _getCarouselImageList(){
    HttpRequestUtil.xiaomiShopApi.getCarouselImage().then((value){
      if(value.result!=null){
        carouselImageList.value = value.result!;
        update();
      }
    });
  }

  // 获取热销甄选轮播图
  void _getBestSellingCarouselImageList(){
    HttpRequestUtil.xiaomiShopApi.getCarouselImage(position: 2).then((value){
      if(value.result!=null){
        bestSellingCarouselImageList.value = value.result!;
        update();
      }
    });
  }

  void _getJinGangDistrictList(){
    HttpRequestUtil.xiaomiShopApi.getJinGangDistrict().then((value) {
      if(value.result!=null){
        jinGangDistrictList.value = value.result!;
        update();
      }
    });
  }
}
