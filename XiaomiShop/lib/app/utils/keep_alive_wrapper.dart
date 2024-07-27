
import 'package:flutter/widgets.dart';

// 保持页面状态的控件，需要在PageView或者TabView中使用
class KeepALiveWrapper extends StatefulWidget {
  const KeepALiveWrapper({super.key, required this.child, this.keepLive = true});

  final Widget child;
  final bool keepLive;

  @override
  State<KeepALiveWrapper> createState() => _KeepALiveWrapperState();
}

class _KeepALiveWrapperState extends State<KeepALiveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => widget.keepLive;
}
