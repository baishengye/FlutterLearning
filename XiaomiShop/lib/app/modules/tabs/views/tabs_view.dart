import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
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
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户"),
            ],
          ),
        ));
  }
}
