import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
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
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AppBar(
                title: const Text('HomeView'),
                centerTitle: true,
              ),
            ),
            ListView.builder(itemBuilder: (context, index) {
              if (index == 0) {
                return _bannerWidget();
              } else {
                return InkWell(
                    onTap: () {
                      LogUtil.d("第$index行数据");
                    },
                    child: SizedBox(
                      child: Text("第$index行数据"),
                    ));
              }
            })
          ],
        )));
  }

  Widget _bannerWidget(){
    return SizedBox(
      height: 682.height,
      width: 1.screenWidth,
      child: Obx(() => Swiper(
        autoplay: true,
        indicatorLayout: PageIndicatorLayout.SCALE,
        itemBuilder: (context, index) {
          return Image.network(
            HttpRequestUtil.replaceUrl(
                controller.focusList[index].pic),
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
