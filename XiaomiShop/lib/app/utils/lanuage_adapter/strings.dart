import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_generator/easy_localization_generator.dart';

import 'localiztion_config.dart';

part 'strings.g.dart';

@SheetLocalization(
  injectGenerationDateTime: true,
  immediateTranslationEnabled: true,
  version: 1,
  outDir: '${LocalizationConfig.translationsDirPath}/',
  outName: LocalizationConfig.translationsFileName,
  preservedKeywords: [],
)
class _Strings {}