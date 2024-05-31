import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/common/dialog/dialog_util.dart';
import 'package:wanandroid/common/localization/localiztion_config.dart';
import 'package:wanandroid/common/localization/strings.dart';
import 'package:wanandroid/common/utils/typedef_util.dart';

class LocalizationUtil {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> setLocale(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
  }

  static Locale getLanguage(BuildContext context) {
    return context.locale;
  }

  static showLanguageDialog(BuildContext context) {
    StringList list = [
      Strings.languageDefault,
      Strings.languageZhCn,
      Strings.languageEnUs,
    ];
    DialogUtil.showCommitOptionDialog(context, list, (index) {
      switch (index) {
        case 0:
          setLocale(context, context.deviceLocale);
          break;
        case 1:
          setLocale(context, LocalizationConfig.zhCn);
          break;
        case 2:
          setLocale(context, LocalizationConfig.enUs);
          break;
      }
    }, height: 150.0);
  }
}