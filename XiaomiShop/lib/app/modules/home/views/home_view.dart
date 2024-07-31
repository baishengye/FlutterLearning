import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
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
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('HomeView', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
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
