import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:xiaomishop/app/modules/cart/views/cart_view.dart';
import 'package:xiaomishop/app/modules/category/views/category_view.dart';
import 'package:xiaomishop/app/modules/give/views/give_view.dart';
import 'package:xiaomishop/app/modules/home/views/home_view.dart';
import 'package:xiaomishop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  RxInt currentTab = 0.obs;
  final List<Widget> tagPages= const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentTab.value,keepPage: true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateCurrentTab(index){
    currentTab.value = index;
    pageController.jumpToPage(index);
    update();
  }
}
