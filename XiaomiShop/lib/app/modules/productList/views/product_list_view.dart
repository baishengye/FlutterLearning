import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  static void showProductList(){
    Get.toNamed(Routes.PRODUCT_LIST);
  }

  const ProductListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
