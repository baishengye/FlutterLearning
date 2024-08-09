import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/lanuage_adapter/strings.dart';

import '../../../utils/lanuage_adapter/lanuage_util.dart';
import '../../../utils/screen_adapter/screen_adapter.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context, const Size(1080, 2400));
    LocalizationUtil.updateLocal(context, context.deviceLocale);

    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(), //禁止左右滑动
            children: controller.tagPages,
            onPageChanged: (index){
              controller.updateCurrentTab(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            //选中的颜色
            currentIndex: controller.currentTab.value,
            //第几个菜单被选中
            type: BottomNavigationBarType.fixed,
            //如果底部有4个或以上的元素需要有此项
            onTap: (index) {
              controller.updateCurrentTab(index);
            },
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: Strings.home),
              BottomNavigationBarItem(icon: const Icon(Icons.category), label: Strings.category),
              BottomNavigationBarItem(icon: const Icon(Icons.room_service), label: Strings.service),
              BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: Strings.shoppingCar),
              BottomNavigationBarItem(icon: const Icon(Icons.people), label: Strings.user),
            ],
          ),
        ));
  }
}
