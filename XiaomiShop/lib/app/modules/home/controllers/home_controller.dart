import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/network/http/dio_client.dart';

import '../../../data/focus_bean.dart';
import '../../../utils/network/http/http_request.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt count = 0.obs;
  final RxList<FocusResultBean> focusList = <FocusResultBean>[].obs;
  @override
  void onInit() {
    super.onInit();
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
