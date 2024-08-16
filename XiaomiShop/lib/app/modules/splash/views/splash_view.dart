import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:xiaomishop/app/utils/screen_adapter/screen_adapter.dart';
import 'package:xiaomishop/generated/assets.dart';

import '../../../utils/refresh/refresh_load_util.dart';
import '../../../utils/splash/splash_util.dart';
import '../controllers/splash_controller.dart';
import '../../../utils/lanuage_adapter/lanuage_util.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    SplashUtil.remove();
    ScreenAdapter.init(context, const Size(1080, 2400));
    LocalizationUtil.updateLocal(context, context.deviceLocale);
    RefreshLoadUtil.init();

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.lottieSplashWelcome,
          fit: BoxFit.cover,
          controller: controller.animationController,
          onLoaded: (composition) {
            controller.animationController
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
