
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenAdapter on num{
  void init(context,size){
    ScreenUtil.init(context,designSize:size,
      minTextAdapt: true,
      splitScreenMode: true);
  }

  double get width => w;

  double get height => h;

  double get fontSize => sp;

  double get screenWidth => sw;

  double get screenHeight => sh;
}