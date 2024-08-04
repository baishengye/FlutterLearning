import 'dart:math';

import 'package:get/get.dart';

import '../../../data/category_entity.dart';
import '../../../utils/network/http/http_request.dart';

class CategoryController extends GetxController {

  // 一级分类
  final RxList<CategoryResult> topCategoryList = <CategoryResult>[].obs;

  // 二级分类
  final RxList<CategoryResult> secondaryCategoryList = <CategoryResult>[].obs;

  // 当前一级分类
  final RxInt currentTopCategory = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _getAllTopCategoryList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取一级分类
  void _getAllTopCategoryList(){
    HttpRequestUtil.xiaomiShopApi.getAllCategory().then((value){
      topCategoryList.value = value.result;
      updateCurrentTopCategory(min(max(currentTopCategory.value, 0),value.result.length));
    });
  }

  // 获取对应的二级分类
  void _getSecondaryCategoryListByTopCategory(String id){
    HttpRequestUtil.xiaomiShopApi.getAllCategory(id: id).then((value){
      secondaryCategoryList.value = value.result;
      update();
    });
  }

  // 更新当前的一级分类
  void updateCurrentTopCategory(index){
    currentTopCategory.value = index;
    _getSecondaryCategoryListByTopCategory(topCategoryList[index].id);
  }
}
