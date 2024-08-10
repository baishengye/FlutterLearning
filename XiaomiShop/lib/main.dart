import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/immersive/immersive_util.dart';
import 'package:xiaomishop/app/utils/network/http/http_request.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:xiaomishop/app/utils/splash/splash_util.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/lanuage_adapter/lanuage_util.dart';
import 'app/utils/lanuage_adapter/localiztion_config.dart';

void main() async {
  SplashUtil.preserve();
  await LocalizationUtil.ensureInitialized();
  await ScreenAdapter.ensureScreenSize();

  runApp(
    EasyLocalizationWidget(),
  );
}

class EasyLocalizationWidget extends StatelessWidget {
  EasyLocalizationWidget({super.key}) {
    ImmersiveUtil.immersiveStatusBar();
    HttpRequestUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocalizationConfig.supportedLocales,
      path: LocalizationConfig.translationsFilePath,
      fallbackLocale: LocalizationConfig.zhCn,
      //如果调用语言失败就用中文
      startLocale: LocalizationConfig.zhCn,
      //初始默认使用系统语言
      saveLocale: true,
      //保存上次的语言设置到本地
      assetLoader: CsvAssetLoader(),
      child: const XiaomiShopApp(),
    );
  }
}

// 这里有个坑，EasyLocalization中的child必须要另起一个StatelessWidget作为App才能生效
class XiaomiShopApp extends StatelessWidget {
  const XiaomiShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    var app = GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          ///建议打开Material主题，否则页面风格太难看
          useMaterial3: true,
        ),
        title: "小米商城",
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);

    return app;
  }
}
