import 'dart:ui';

import 'package:xiaomishop/app/utils/lanuage_adapter/strings.dart';

class LocalizationConfig {
  static const supportedLocales = Strings.supportedLocales;
  static const String translationsDirPath = "assets/translations";
  static const String translationsFileName = "translations.csv";
  static const String translationsFilePath = "$translationsDirPath/$translationsFileName";

  static const Locale zhCn = Locale('zh', 'CN');
  static const Locale enUs = Locale('en', 'US');
}