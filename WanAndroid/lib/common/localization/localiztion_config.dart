import 'dart:ui';

import 'package:wanandroid/common/localization/strings.dart';

class LocalizationConfig {
  static const String translationsDirPath = "assets/translations";
  static const String translationsFileName = "translations.csv";
  static const String translationsFilePath = "$translationsDirPath/$translationsFileName";

  static const Locale zhCn = Locale('zh', 'CN');
  static const Locale enUs = Locale('en', 'US');
}