import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:xiaomishop/app/utils/image/image_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  static const CID = "CID";

  static void showProductList(String cid) {
    Get.toNamed(Routes.PRODUCT_LIST, arguments: {CID: cid});
  }

  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      endDrawer: const Drawer(
          child: DrawerHeader(
            child: Text("右侧筛选"),
          )
      ),
      appBar: _appbarWidget(context),
      body: Stack(
        children: [_goodListWidget(context), _subHeaderWidget(context)],
      ),
    );
  }

  AppBar _appbarWidget(BuildContext context){
    return AppBar(
      title: Container(
        width: double.infinity,
        height: 96.height,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(30.radius),
        ),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(34.width, 0, 10.width, 0),
                child: const Icon(Icons.search, color: Colors.black54),
              ),
              Text("",
                  style:
                  TextStyle(color: Colors.black54, fontSize: 32.fontSize))
            ],
          ),
          onTap: () {
            // Get.toNamed(Routes.PRODUCT_SEARCH);
          },
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: const [Text("")],
    );
  }

  Widget _goodListWidget(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 120.height,
        child: EasyRefresh(
          controller: controller.easyRefreshController,
          child: Obx(() => controller.goodList.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                      26.width, 26.height, 26.width, 26.height),
                  itemCount: controller.goodList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 26.height),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.radius)),
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(60.width),
                                  width: 400.width,
                                  height: 460.height,
                                  child: ImageUtil.getNetworkImageWidget(
                                      HttpRequestUtil.replaceUrl(
                                          controller.goodList[index].pic),
                                      fit: BoxFit.fitHeight)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 20.height),
                                        child: Text(
                                          controller.goodList[index].title,
                                          style: TextStyle(
                                              fontSize: 42.fontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 20.height),
                                      child: Text(
                                        controller.goodList[index].subTitle,
                                        style: TextStyle(fontSize: 34.fontSize),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(bottom: 20.height),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text("CUP",
                                                  style: TextStyle(
                                                      fontSize: 34.fontSize,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("Helio G25",
                                                  style: TextStyle(
                                                    fontSize: 34.fontSize,
                                                  ))
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text("高清拍摄",
                                                  style: TextStyle(
                                                      fontSize: 34.fontSize,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("1300万像素",
                                                  style: TextStyle(
                                                    fontSize: 34.fontSize,
                                                  ))
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text("超大屏",
                                                  style: TextStyle(
                                                      fontSize: 34.fontSize,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("6.1寸",
                                                  style: TextStyle(
                                                    fontSize: 34.fontSize,
                                                  ))
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "￥${controller.goodList[index].price}起",
                                      style: TextStyle(
                                          fontSize: 38.fontSize,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: Text(
                      "暂无数据,点击刷新",
                      style: TextStyle(
                          fontSize: 32.fontSize, color: Colors.black54),
                    ),
                    onPressed: () {
                      controller.getGoodList(true);
                    },
                  ))),
          onRefresh: () {
            controller.getGoodList(true);
          },
          onLoad: () {
            controller.getGoodList(false);
          },
        ));
  }

  Widget _subHeaderWidget(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Obx(() => controller.goodList.isNotEmpty
          ? Container(
              width: double.infinity,
              height: 120.height,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                      width: 2.height,
                      color: const Color.fromRGBO(233, 233, 233, 0.9)),
                ),
              ),
              child: Row(
                children: controller.subHeaderList
                    .map((value) => Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 16.height, 0, 16.height),
                                  child: Text(
                                    value.title,
                                    style: TextStyle(
                                        color:
                                            controller.selectHeaderId.value ==
                                                    value.id
                                                ? Colors.red
                                                : Colors.black54,
                                        fontSize: 32.fontSize),
                                  ),
                                ),
                                onTap: () {
                                  controller.subHeaderChange(value.id);
                                },
                              ),
                              _showIcon(value.id)
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          : const Text("")),
    );
  }

  //自定义箭头组件
  Widget _showIcon(id) {
    //controller.subHeaderListSort 作用 : 响应式状态  为了改变状态
    if (id == 2 ||
        id == 3 ||
        controller.subHeaderListSort.value == 1 ||
        controller.subHeaderListSort.value == -1) {
      if (controller.subHeaderList[id - 1].sort == 1) {
        return const Icon(Icons.arrow_drop_down, color: Colors.black54);
      } else {
        return const Icon(Icons.arrow_drop_up, color: Colors.black54);
      }
    } else {
      return const Text("");
    }
  }
}
