import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/common/utils/log_util.dart';

import '../config/config.dart';
import 'env_config.dart';

///往下共享环境配置
class ConfigWrapper extends StatelessWidget {
  const ConfigWrapper({super.key, this.config, this.child});

  @override
  Widget build(BuildContext context) {
    ///设置 Config.DEBUG 的静态变量cxxxxxxxx
    Config.debug = config?.debug;
    LogUtil.d("ConfigWrapper build ${Config.debug}");
    return _InheritedConfig(config: config, child: child!);
  }

  static EnvConfig? of(BuildContext context) {
    final _InheritedConfig inheritedConfig =
        context.dependOnInheritedWidgetOfExactType<_InheritedConfig>()!;
    return inheritedConfig.config;
  }

  final EnvConfig? config;

  final Widget? child;
}

class _InheritedConfig extends InheritedWidget {
  const _InheritedConfig(
      {required this.config, required super.child});

  final EnvConfig? config;

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) =>
      config != oldWidget.config;
}
