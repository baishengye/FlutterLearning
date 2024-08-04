import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/icon/xiaomi_icons.dart';
import 'package:xiaomishop/app/utils/immersive/immersive_util.dart';
import 'package:xiaomishop/app/utils/keep_alive/keep_alive_wrapper.dart';
import 'package:xiaomishop/app/utils/log/log_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';
import 'package:xiaomishop/generated/assets.dart';

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
              borderRadius: BorderRadius.circular(30),
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
              onTap: () {
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
                    color: controller.appBarStatus.value
                        ? Colors.black87
                        : Colors.white,
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
      bottom: 0,
      child: ListView(
        controller: controller.listViewScrollController,
        children: [
          _carouselImageWidget(context),
          _titleBannerWidget(context),
          _jinGangDistrict(context),
          _imageBannerWidget(context),
          _bestSellingGoods(context),
          _sellingGoods(context),
        ],
      ),
    );
  }

  // 热销甄选商品
  Widget _bestSellingGoods(context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(30.width, 40.height, 30.width, 20.height),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("热销臻选",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 46.fontSize)),
              Text("更多手机推荐 >", style: TextStyle(fontSize: 38.fontSize))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.width, 0, 20.width, 20.height),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 738.height,
                  child: Obx(() => Swiper(
                        itemCount:
                            controller.bestSellingCarouselImageList.length,
                        autoplay: true,
                        loop: true,
                        itemBuilder: (context, index) {
                          return Image.network(
                            HttpRequestUtil.replaceUrl(controller
                                .bestSellingCarouselImageList[index].pic),
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(
                            margin: const EdgeInsets.all(0.0),
                            builder: SwiperCustomPagination(builder:
                                (BuildContext context,
                                    SwiperPluginConfig config) {
                              return ConstrainedBox(
                                constraints:
                                    BoxConstraints.expand(height: 36.height),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child:
                                            const RectSwiperPaginationBuilder(
                                          color: Colors.black12,
                                          activeColor: Colors.black54,
                                        ).build(context, config),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })),
                      )),
                ),
              ),
              SizedBox(width: 20.width),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 738.height,
                  child: Obx(() => Column(
                        children: controller.bastSellingGoodList
                            .asMap()
                            .entries
                            .map((entrie) {
                          return Expanded(
                            flex: 1,
                            child: Container(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              margin: EdgeInsets.fromLTRB(
                                  0, 0, 0, entrie.key == 2 ? 0 : 20.height),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20.height),
                                        Text(
                                          "${entrie.value.title}",
                                          style: TextStyle(
                                              fontSize: 38.fontSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 20.height),
                                        Text(
                                          "${entrie.value.subTitle}",
                                          style:
                                              TextStyle(fontSize: 28.fontSize),
                                        ),
                                        SizedBox(height: 20.height),
                                        Text("￥${entrie.value.price}",
                                            style: TextStyle(
                                                fontSize: 34.fontSize)),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.height),
                                              child: Image.network(
                                                  HttpRequestUtil.replaceUrl(
                                                      entrie.value.pic),
                                                  fit: BoxFit.cover),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // 热卖商品
  Widget _sellingGoods(context) {
    return Column(
      children: [
        Padding(
            padding:
                EdgeInsets.fromLTRB(30.width, 40.height, 30.width, 20.height),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("省心优惠",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 46.height)),
                Text("全部优惠 >", style: TextStyle(fontSize: 38.fontSize))
              ],
            )),
        Obx(() => Container(
              padding: EdgeInsets.all(26.height),
              color: const Color.fromRGBO(246, 246, 246, 1),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 26.width,
                crossAxisSpacing: 26.height,
                itemCount: controller.sellingGoodList.length,
                //注意
                shrinkWrap: true,
                //收缩，让元素宽度自适应
                physics: const NeverScrollableScrollPhysics(),
                //禁止滑动
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20.height),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.height),
                            child: Image.network(
                              HttpRequestUtil.replaceUrl(
                                  controller.sellingGoodList[index].sPic),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.height),
                            width: double.infinity,
                            child: Text(
                              "${controller.sellingGoodList[index].title}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 42.fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          if(controller.sellingGoodList[index].subTitle?.isNotEmpty == true) Container(
                            padding: EdgeInsets.all(10.height),
                            width: double.infinity,
                            child: Text(
                              "${controller.sellingGoodList[index].subTitle}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 32.fontSize),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.fontSize),
                            width: double.infinity,
                            child: Text(
                              "¥${controller.sellingGoodList[index].price}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 32.fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ))
      ],
    );
  }

  // 文字banner图
  Widget _titleBannerWidget(context) {
    return SizedBox(
      width: 1.screenWidth,
      height: 92.height,
      child: Image.asset(
        Assets.imagesXiaomiBanner,
        fit: BoxFit.cover,
      ),
    );
  }

  // 图片banner图
  Widget _imageBannerWidget(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.width, 20.height, 20.width, 20.height),
      child: Container(
        width: 1.screenWidth,
        height: 480.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage(Assets.imagesXiaomiBanner2),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _jinGangDistrict(context) {
    return SizedBox(
        width: 1.screenWidth,
        height: 470.height,
        child: Obx(() => Swiper(
              outer: true,
              itemCount: controller.jinGangDistrictList.length ~/ 10,
              itemWidth: 1.screenWidth,
              itemHeight: 470.height,
              itemBuilder: (context, index) {
                return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, //一行5个
                      crossAxisSpacing: 20.width, // 元素边距
                      mainAxisSpacing: 20.width // 主方向边据
                      ),
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 140.width,
                          height: 140.height,
                          child: Image.network(
                            HttpRequestUtil.replaceUrl(controller
                                .jinGangDistrictList[index * 10 + i].pic),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 4.height, 0, 0),
                          child: Text(
                            "${controller.jinGangDistrictList[index * 10 + i].title}",
                            style: TextStyle(fontSize: 34.fontSize),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              pagination: SwiperPagination(
                  margin: const EdgeInsets.all(0.0),
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 20.height),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: const RectSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: Colors.black54,
                              ).build(context, config),
                            ),
                          )
                        ],
                      ),
                    );
                  })),
            )));
  }

  // 轮播图
  Widget _carouselImageWidget(context) {
    return SizedBox(
      height: 682.height,
      width: 1.screenWidth,
      child: Obx(() => Swiper(
            loop: true,
            autoplay: true,
            indicatorLayout: PageIndicatorLayout.COLOR,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            itemBuilder: (context, index) {
              return Image.network(
                HttpRequestUtil.replaceUrl(
                    controller.carouselImageList[index].pic),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              );
            },
            itemCount: controller.carouselImageList.length,
            itemHeight: 682.height,
            itemWidth: 1.screenWidth,
          )),
    );
  }
}
