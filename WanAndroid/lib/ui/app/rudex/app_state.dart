
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:wanandroid/ui/app/rudex/theme_redux.dart';


/**
 * Redux全局State
 */

///全局Redux store 的对象，保存State数据
class AppState {
  ///主题数据
  ThemeData? themeData;

  ///构造方法
  AppState(
      {this.themeData});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    ///通过 ThemeDataReducer 将 AppState 内的 themeData 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action)
  );
}

final List<Middleware<AppState>> middleware = [
];