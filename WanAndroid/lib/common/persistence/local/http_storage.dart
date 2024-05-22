import 'package:wanandroid/common/config/http_config.dart';

import 'local_storage.dart';

class HttpStorage {
  ///
  /// 获取host
  ///
  static Future<String?> getHost() async {
    return await LocalStorage.get(HttpStorageKey.HOST,HttpConfig.BASE_URL);
  }

  ///
  /// 保存host
  ///
  static saveHost(String host) async {
    await LocalStorage.save(HttpStorageKey.HOST, host);
  }
}

class HttpStorageKey{
  static const String HOST = "host";
}