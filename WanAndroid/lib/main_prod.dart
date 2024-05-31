import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/ui/error/page/error_page.dart';

import 'ui/app/page/app_page.dart';
import 'common/env/config_wrapper.dart';
import 'common/env/env_config.dart';
import 'common/env/prod.dart';

void main() {
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      ///此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
      return ErrorPage(
          "${details.exception}\n ${details.stack}",
          details);
    };
    runApp(ConfigWrapper(
      config: EnvConfig.fromJson(config),
      child: const WanAndroidApp(),
    ));
    ///屏幕刷新率和显示率不一致时的优化
    GestureBinding.instance.resamplingEnabled = true;
  }, (Object obj, StackTrace stack) {
    ///do not thing
  });
}