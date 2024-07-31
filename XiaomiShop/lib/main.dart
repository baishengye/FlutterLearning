import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/immersive/immersive_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    XiaomiShopApp(),
  );
}

class XiaomiShopApp extends StatelessWidget {
  XiaomiShopApp ({super.key}){
    ImmersiveUtil.immersiveStatusBar();
    HttpRequestUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    1.init(context,const Size(1080, 1920));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

