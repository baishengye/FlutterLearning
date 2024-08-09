import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/log/log_util.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin{

  late final AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){//动画结束的时候跳转到其他页面
        Get.toNamed(Routes.TABS);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
