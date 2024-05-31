
import 'package:flutter/material.dart';
import 'package:wanandroid/common/style/color_styles.dart';
import 'package:wanandroid/widget/flex_button.dart';
import 'package:wanandroid/widget/never_overscroll_indicator.dart';

class DialogUtil{
  ///弹出 dialog
  static Future<T?> showDialogPerform<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder? builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(
            ///不受系统字体缩放影响
              data: MediaQueryData.fromView(
                  WidgetsBinding.instance.platformDispatcher.views.first)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: NeverOverScrollIndicator(
                needOverload: false,
                child: SafeArea(child: builder!(context)),
              ));
        });
  }

  ///列表item dialog
  static Future<void> showCommitOptionDialog(
      BuildContext context,
      List<String?>? commitMaps,
      ValueChanged<int> onTap, {
        width = 250.0,
        height = 400.0,
        List<Color>? colorList,
      }) {
    return showDialogPerform(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: ColorStyles.white,
                //用一个BoxDecoration装饰器提供背景图片
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ListView.builder(
                  itemCount: commitMaps?.length ?? 0,
                  itemBuilder: (context, index) {
                    return FlexButton(
                      maxLines: 1,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      color: colorList != null
                          ? colorList[index]
                          : Theme.of(context).primaryColor,
                      text: commitMaps![index],
                      textColor: ColorStyles.white,
                      onPress: () {
                        Navigator.pop(context);
                        onTap(index);
                      },
                    );
                  }),
            ),
          );
        });
  }
}