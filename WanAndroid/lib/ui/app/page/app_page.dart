import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanandroid/common/event/http_error_event.dart';
import 'package:wanandroid/common/event/index.dart';
import 'package:wanandroid/common/localization/localiztion_config.dart';
import 'package:wanandroid/common/style/color_styles.dart';
import 'package:wanandroid/common/style/styles_util.dart';
import 'package:wanandroid/ui/app/rudex/app_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wanandroid/ui/debug/debug_label.dart';
import 'package:wanandroid/ui/splash/page/splash_page.dart';

class WanAndroidApp extends StatefulWidget {
  const WanAndroidApp({super.key});

  @override
  State<WanAndroidApp> createState() => _WanAndroidAppState();
}

class _WanAndroidAppState extends State<WanAndroidApp>
    with HttpErrorListener {

  NavigatorObserver navigatorObserver = NavigatorObserver();

  /// 创建Store，引用 GSYState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = Store<AppState>(
    appReducer,

    ///拦截器
    middleware: middleware,

    ///初始化数据
    initialState: AppState(
        themeData: StylesUtil.getThemeData(ColorStyles.primarySwatch))
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      /// 通过 with NavigatorObserver ，在这里可以获取可以往上获取到
      /// MaterialApp 和 StoreProvider 的 context
      /// 还可以获取到 navigator;
      /// 比如在这里增加一个监听，如果 token 失效就退回登陆页。
      navigatorObserver.navigator!.context;
      navigatorObserver.navigator;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 使用 flutter_redux 做全局状态共享
    /// 通过 StoreProvider 应用 store
    return StoreProvider(
      store: store,
      child: StoreBuilder<AppState>(builder: (context, store) {
        Widget app = EasyLocalization(
            supportedLocales: context.supportedLocales,
            path: LocalizationConfig.translationsDirPath, // <-- change the path of the translation files
            fallbackLocale: LocalizationConfig.zhCn,
            startLocale: context.deviceLocale, //初始默认使用系统语言
            saveLocale: true, //保存上次的语言设置到本地
            child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                navigatorKey: navKey,
                theme: store.state.themeData,
                navigatorObservers: [navigatorObserver],

                ///命名式路由
                /// "/" 和 MaterialApp 的 home 参数一个效果
                ///⚠️ 这里的 name调用，里面 pageContainer 方法有一个 MediaQuery.of(context).copyWith(textScaleFactor: 1),
                ///⚠️ 而这里的 context 用的是 WidgetBuilder 的 context  ～
                ///⚠️ 所以 MediaQuery.of(context) 这个 InheritedWidget 就把这个 context “登记”到了 Element 的内部静态 _map 里。
                ///⚠️ 所以键盘弹出来的时候，触发了顶层的 MediaQueryData 发生变化，自然就触发了“登记”过的 context 的变化
                ///⚠️ 比如 LoginPage 、HomePage ····
                ///⚠️ 所以比如你在 搜索页面 键盘弹出时，下面的 HomePage.sName 对应的 WidgetBuilder 会被触发
                ///⚠️ 这个是我故意的，如果不需要，可以去掉 pageContainer 或者不要用这里的 context
                routes: {
                  SplashPage.sName: (context){
                    DebugLabel.showDebugLabel(context);
                    return const SplashPage();
                  } ,
                })
        );
        return app;
      }),
    );
  }

}

mixin HttpErrorListener on State<WanAndroidApp> {
  StreamSubscription? stream;

  GlobalKey<NavigatorState> navKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream!.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int? code, message) {
    var context = navKey.currentContext!;
    switch (code) {
      default:
        break;
    }
  }

  showToast(String message) {

  }
}
