// ignore_for_file: unused_element

import 'dart:ui';

import 'package:easy_localization_generator/easy_localization_generator.dart';
import 'package:wanandroid/common/localization/localiztion_config.dart';

part 'strings.g.dart';

@SheetLocalization(
  // Remove (or comment out) this to use the local file
  // docId: '1Ee__wYfVZlSn2bzn2xx_D9ar_EPGV0i__ULqljIGidY',
  injectGenerationDateTime: true,
  immediateTranslationEnabled: false,
  version: 5,
  outDir: '${LocalizationConfig.translationsDirPath}/',
  outName: LocalizationConfig.translationsFileName,
  preservedKeywords: [],
)
class _Strings {}