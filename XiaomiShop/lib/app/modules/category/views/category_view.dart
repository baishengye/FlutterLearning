import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/image/image_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import '../../../utils/lanuage_adapter/strings.dart';
import '../../productList/views/product_list_view.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.height,
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            width: 840.width,
            height: 96.height,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(34.width, 0, 10.width, 0),
                  child: const Icon(Icons.search, color: Colors.black87),
                ),
                Text(Strings.phone,
                    style:
                        TextStyle(color: Colors.black87, fontSize: 32.fontSize))
              ],
            ),
          ),
          onTap: () {},
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message, color: Colors.black87))
        ],
        elevation: 0,
      ),
      body: Row(
        children: [
          _topCategory(context),_secondaryCategory(context)
        ],
      ),
    );
  }

  // 一级分类
  Widget _topCategory(BuildContext context){
    return SizedBox(
      width: 280.width,
      height: double.infinity,
      child: Obx(() => ListView.builder(
        itemCount: controller.topCategoryList.length,
        itemBuilder: (context,index){
          return SizedBox(
            width: double.infinity,
            height: 180.height,
            child: InkWell(
              onTap: (){
                controller.updateCurrentTopCategory(index);
              },
              child: Obx(() => Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 10.width,
                      height: 46.height,
                      color: controller.currentTopCategory.value == index? Colors.red : Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.topCategoryList[index].title,
                      style: TextStyle(
                          fontSize: 36.fontSize,
                          fontWeight:
                          controller.currentTopCategory.value == index
                              ? FontWeight.bold
                              : FontWeight.normal
                      ),
                    ),
                  )
                ],
              )),
            ),
          );
        },
      )),
    );
  }

  // 二级分类
  Widget _secondaryCategory(BuildContext context){
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Obx(() => GridView.builder(
          itemCount: controller.secondaryCategoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40.width,
            mainAxisSpacing: 20.height,
            childAspectRatio: 240/340
          ),
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                ProductListView.showProductList();
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: ImageUtil.getNetworkImageWidget(HttpRequestUtil.replaceUrl(controller.secondaryCategoryList[index].pic),
                      fit: BoxFit.fitHeight,
                    placeholder: ImageUtil.defaultPlaceholder)//根据宽度适配高度
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,10.height, 0, 0),
                    child: Text(
                      controller.secondaryCategoryList[index].title,
                      style: TextStyle(fontSize: 34.fontSize),
                    ),
                  )
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
