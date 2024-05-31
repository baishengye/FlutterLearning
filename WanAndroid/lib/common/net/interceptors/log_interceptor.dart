// ignore_for_file: type_literal_in_constant_pattern

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wanandroid/common/config/config.dart';

/// Log 拦截器
class LogInterceptors extends InterceptorsWrapper {
  static List<Map?> sHttpResponses = [];
  static List<String?> sResponsesHttpUrl = [];

  static List<Map<String, dynamic>?> sHttpRequest = [];
  static List<String?> sRequestHttpUrl = [];

  static List<Map<String, dynamic>?> sHttpError = [];
  static List<String?> sHttpErrorUrl = [];

  @override
  onRequest(RequestOptions options, handler) async {
    if (Config.debug!) {
      options.headers.forEach((k, v) => options.headers[k] = v ?? "");
    }
    try {
      addLogic(sRequestHttpUrl, options.path);
      dynamic data;
      if (options.data is Map) {
        data = options.data;
      } else {
        data = <String, dynamic>{};
      }
      var map = {
        "header:": {...options.headers},
      };
      if (options.method == "POST") {
        map["data"] = data;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    switch (response.data.runtimeType) {
      case Map || List:
        {
          try {
            var data = <String, dynamic>{};
            data["data"] = response.data;
            addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
            addLogic(sHttpResponses, data);
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
      case String:
        {
          try {
            var data = <String, dynamic>{};
            data["data"] = response.data;
            addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
            addLogic(sHttpResponses, data);
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
    }
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, handler) async {
    try {
      addLogic(sHttpErrorUrl, err.requestOptions.path);
      var errors = <String, dynamic>{};
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return super.onError(err, handler);
  }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }
}
