
import 'package:easy_refresh/easy_refresh.dart';

class RefreshLoadUtil{
  static void init(){
    // 全局设置
    EasyRefresh.defaultHeaderBuilder = () => const ClassicHeader();
    EasyRefresh.defaultFooterBuilder = () => const ClassicFooter();
  }
}