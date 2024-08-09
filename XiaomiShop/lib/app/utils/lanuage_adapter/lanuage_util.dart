
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationUtil {
  static Future<void> ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> updateLocal(context,local) async {
    EasyLocalization.of(context)?.setLocale(local);
  }
}