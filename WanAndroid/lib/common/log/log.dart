
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:wanandroid/common/config/config.dart';



class LogUtil {
  static get logDebug => Config.DEBUG == true && kDebugMode;
  static Logger logger = Logger();
  static void e(String msg) {
    if (logDebug) {
      logger.e(msg);
    }
  }
  static void w(String msg) {
    if (logDebug) {
      logger.w(msg);
    }
  }

  static void i(String msg) {
    if (logDebug) {
      logger.i(msg);
    }
  }

  static void d(String msg) {
    if (logDebug) {
      logger.d(msg);
    }
  }

  static void v(String msg) {
    if (logDebug) {
      logger.v(msg);
    }
  }

  static void wtf(String msg) {
    if (logDebug) {
      logger.wtf(msg);
    }
  }

  static void f(String msg) {
    if (logDebug) {
      logger.f(msg);
    }
  }
}