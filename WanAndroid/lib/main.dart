import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/common/log/log.dart';
import 'package:wanandroid/page/error_page.dart';

import 'app.dart';
import 'common/env/config_wrapper.dart';
import 'common/env/dev.dart';
import 'common/env/env_config.dart';

void main() {
  ///错误处理框架
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      ///此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
      return ErrorPage("${details.exception}\n ${details.stack}", details);
    };
    runApp(ConfigWrapper(
      config: EnvConfig.fromJson(config),
      child: const WanAndroidApp(),
    ));
    ///屏幕刷新率和显示率不一致时的优化，必须挪动到 runApp 之后
    GestureBinding.instance.resamplingEnabled = true;
  }, (Object obj, StackTrace stack) {
    LogUtil.e("obj: ${obj.toString()}\n stack: ${stack.toString()}");
  });
}