import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/icon/xiaomi_icons.dart';
import 'package:xiaomishop/app/utils/immersive/immersive_util.dart';
import 'package:xiaomishop/app/utils/keep_alive/keep_alive_wrapper.dart';
import 'package:xiaomishop/app/utils/log/log_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_config.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepALiveWrapper(
        keepLive: true,
        child: Scaffold(
            body: Stack(
          children: [_mainWidget(context), _appbarWidget(context)],
        )));
  }

  Widget _appbarWidget(context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(() => AppBar(
            toolbarHeight: 120.height,
            leading: controller.appBarStatus.value
                ? const Text("")
                : const Icon(XiaomiIcons.xiaomi, color: Colors.white),
            leadingWidth: controller.appBarStatus.value ? 40.width : 140.width,
            backgroundColor: controller.appBarStatus.value
                ? Colors.white
                : Colors.transparent,
            title: InkWell(
              child: AnimatedContainer(
                width: controller.appBarStatus.value ? 800.width : 620.width,
                height: 96.height,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    borderRadius: BorderRadius.circular(30)),
                duration: const Duration(milliseconds: 600),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.width, 0, 10.width, 0),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                    Text(
                      "手机",
                      style: TextStyle(color: Colors.black54, fontSize: 32.sp),
                    )
                  ],
                ),
              ),
              onTap: (){
                LogUtil.d("点击搜索");
              },
            ),
            centerTitle: true,
            elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color:
                controller.appBarStatus.value ? Colors.black87 : Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.message,
                  color: controller.appBarStatus.value
                      ? Colors.black87
                      : Colors.white))
        ],
          )),
    );
  }

  Widget _mainWidget(context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -ImmersiveUtil.getStatusBar(context),
      child: SizedBox(
        height: 1.screenHeight,
        width: 1.screenWidth,
        child: ListView.builder(
            controller: controller.listViewScrollController,
            itemCount: 40,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _bannerWidget(context);
              } else {
                return InkWell(
                    onTap: () {
                      LogUtil.d("第$index行数据");
                    },
                    child: SizedBox(
                      child: Text("第$index行数据"),
                    ));
              }
            }),
      ),
    );
  }

  Widget _bannerWidget(context) {
    return SizedBox(
      height: 682.height,
      width: 1.screenWidth,
      child: Obx(() => Swiper(
            autoplay: true,
            indicatorLayout: PageIndicatorLayout.SCALE,
            itemBuilder: (context, index) {
              return Image.network(
                HttpRequestUtil.replaceUrl(controller.focusList[index].pic),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              );
            },
            itemCount: controller.focusList.length,
            itemHeight: 682.height,
            itemWidth: 1.screenWidth,
          )),
    );
  }
}
