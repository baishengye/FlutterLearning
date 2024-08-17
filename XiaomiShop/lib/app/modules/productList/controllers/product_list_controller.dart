import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:xiaomishop/app/data/refresh_load_state_entity.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';

import '../../../data/hot_selling_good_entity.dart';
import '../../../data/sub_header_entity.dart';
import '../views/product_list_view.dart';

class ProductListController extends GetxController {

  int page = 1;
  int pageSize = 5;
  String? sort;

  //商品列表
  RxList<HotSellingGoodResult> goodList = <HotSellingGoodResult>[].obs;

  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;
  //主要解决的问题是排序箭头无法更新
  RxInt subHeaderListSort=0.obs;
  //二级导航数据
  List<SubHeaderEntity> subHeaderList = [
    SubHeaderEntity(id: 1, title: "综合", fileds: "all", sort: -1),
    SubHeaderEntity(id: 2, title: "销量", fileds: "salecount", sort: -1),
    SubHeaderEntity(id: 3, title: "价格", fileds: "price", sort: -1),
    SubHeaderEntity(id: 4, title: "筛选", fileds: "all", sort: -1),
  ];

  String? cid = Get.arguments[ProductListView.CID];
  String? search;

  late EasyRefreshController easyRefreshController;

  @override
  void onInit() {
    super.onInit();
    easyRefreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void onReady() {
    super.onReady();
    getGoodList(true);
  }

  @override
  void onClose() {
    super.onClose();
    easyRefreshController.dispose();
  }

  void getGoodList(bool isRefresh){
    var getPage = isRefresh?1:page;
    HttpRequestUtil.xiaomiShopApi.getHotSellingGood(
      cid: cid,
      page: getPage,
      pageSize: pageSize,
      sort: sort,
      search: search,
    ).then((value){
      page = getPage + 1;
      if(isRefresh){
        goodList.clear();
        goodList.addAll(value.result);
      }else{
        goodList.addAll(value.result);
      }
      update();
      if(value.result.length < pageSize){
        if(isRefresh){
          easyRefreshController.finishRefresh(IndicatorResult.noMore,true);
        }else{
          easyRefreshController.finishLoad(IndicatorResult.noMore,true);
        }
      }else{
        if(isRefresh){
          easyRefreshController.finishRefresh(IndicatorResult.success,true);
          easyRefreshController.resetFooter();
        }else{
          easyRefreshController.finishLoad(IndicatorResult.success,true);
        }
      }
    });
  }

  void subHeaderChange(int id) {
    if (id == 4) {
      selectHeaderId.value = id;
      scaffoldGlobalKey.currentState!.openEndDrawer();
      //弹出侧边栏
    } else {
      selectHeaderId.value = id;

      //改变排序  sort=price_-1     sort=price_1
      sort = "${subHeaderList[id - 1].fileds}_${subHeaderList[id - 1].sort}";
      //改变状态
      subHeaderList[id - 1].sort=subHeaderList[id - 1].sort*-1;
      //作用更新状态
      subHeaderListSort.value=subHeaderList[id - 1].sort;
      //重新请求接口
      getGoodList(true);
    }
  }
}
