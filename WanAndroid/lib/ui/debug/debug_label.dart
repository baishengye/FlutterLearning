import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/common/config/config.dart';
import 'package:wanandroid/common/env/config_wrapper.dart';
import 'package:wanandroid/common/localization/localition_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wanandroid/common/utils/device_util.dart';
import 'package:wanandroid/common/utils/navigator_utils.dart';

class DebugLabel {
  static bool hadShow = false;
  static OverlayEntry? _overlayEntry;

  static showDebugLabel(BuildContext context) async {
    if (Config.debug == false) {
      return false;
    }
    if (hadShow) {
      return false;
    }
    hadShow = true;
    var language = LocalizationUtil.getLanguage(context).languageCode;
    var overlayState = Overlay.of(context);
    var (version, platform) = await _getDeviceInfo();
    PackageInfo packInfo = await PackageInfo.fromPlatform();
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    _overlayEntry = OverlayEntry(builder: (context) {
      return GlobalLabel(
          version: packInfo.version,
          deviceInfo: version,
          platform: platform,
          language: language);
    });
    overlayState.insert(_overlayEntry!);
  }

  static resetDebugLabel(BuildContext context) {
    hideDebugLabel();
    showDebugLabel(context);
  }

  static hideDebugLabel() {
    hadShow = false;
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

Future<(String, String)> _getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return (androidInfo.version.sdkInt.toString(), "Android");
  }
  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  String device = await DeviceUtil.getDeviceInfo();
  return (iosInfo.systemVersion , device);
}

class GlobalLabel extends StatefulWidget {
  final String? version;
  final String? deviceInfo;
  final String? platform;
  final String? language;

  const GlobalLabel({super.key, this.version, this.deviceInfo, this.platform, this.language});

  @override
  State<GlobalLabel> createState() => _GlobalLabelState();
}

class _GlobalLabelState extends State<GlobalLabel> {
  bool doubleClick = false;
  bool longClick = false;

  @override
  void dispose() {
    DebugLabel.hadShow = false;
    //_overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: const Alignment(0.97, 0.8),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            child: InkWell(
              onLongPress: () {
                longClick = true;
              },
              onDoubleTap: () {
                doubleClick = true;
                if (longClick && doubleClick) {
                  NavigatorUtil.goDebugDataPage(context);
                }
              },
              child: Text(
                "${widget.platform} ${widget.deviceInfo} ${widget.language} ${widget.version}",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ),
      );
    });
  }
}
