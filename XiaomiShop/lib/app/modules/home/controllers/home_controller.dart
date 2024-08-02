import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/network/http/dio_client.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../../../data/focus_bean.dart';
import '../../../utils/network/http/http_request.dart';

class HomeController extends GetxController {
  final ScrollController listViewScrollController = ScrollController();
  final RxBool appBarStatus = false.obs;

  final RxInt count = 0.obs;
  final RxList<FocusResultBean> focusList = <FocusResultBean>[].obs;
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
    getBannerList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getBannerList(){
    HttpRequestUtil.xiaomiShopApi.getBannerList().then((value){
      if(value.result!=null){
        focusList.value = value.result!;
        update();
      }
    });
  }
}
