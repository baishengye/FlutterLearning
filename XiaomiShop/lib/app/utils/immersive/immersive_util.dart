
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImmersiveUtil{

  static void immersiveStatusBar(){
    //配置透明的状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
    );
    //可侵入状态栏
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  static double getStatusBar(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }
}