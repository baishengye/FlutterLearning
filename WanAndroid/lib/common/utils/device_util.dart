import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtil{
  ///获取设备信息
  static Future<String> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return "";
    }
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.model;
  }
}