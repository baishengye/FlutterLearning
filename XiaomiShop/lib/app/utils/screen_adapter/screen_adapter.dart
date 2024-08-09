
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenAdapter on num{
  static Future<void> ensureScreenSize() async{
     await ScreenUtil.ensureScreenSize();
  }

  static Future<void> init(context,size) async {
    ScreenUtil.init(context,designSize:size,
      minTextAdapt: true,
      splitScreenMode: true); //此方法需要在根路由调用初始化，不能在runApp中进行，因为app还没初始化好就拿不到MediaQuery.of(context)屏幕宽高
  }

  double get width => w;

  double get height => h;

  double get fontSize => sp;

  double get screenWidth => sw;

  double get screenHeight => sh;
}