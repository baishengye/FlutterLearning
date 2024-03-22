import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:ftoast/ftoast.dart' as ftoast;

class DialogApp extends StatelessWidget {
  const DialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogAppState();
}

class _DialogAppState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello Dialog"),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: _alertDialog, child: const Text("使用AlertDialog")),
            ElevatedButton(
                onPressed: _simpleDialog, child: const Text("使用SimpleDialog")),
            ElevatedButton(
                onPressed: _modelBottomSheet,
                child: const Text("使用showModalBottomSheet")),
            ElevatedButton(
                onPressed: _customDialog,
                child: const Text("使用自定义Dialog")),
          ],
        )));
  }

  void _customDialog() async {
    showDialog(context: context, builder: (context){
      return const CustomDialog();
    });
  }

  void _simpleDialog() async {
    var result = await showDialog(
        barrierDismissible: true, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("请选择语言"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  log("汉语");
                  Navigator.pop(context, "汉语");
                },
                child: const Text("汉语"),
              ),
              const Divider(),
              SimpleDialogOption(
                onPressed: () {
                  log("英语");
                  Navigator.pop(context, "英语");
                },
                child: const Text("英语"),
              ),
              const Divider(),
              SimpleDialogOption(
                onPressed: () {
                  log("日语");
                  Navigator.pop(context, "日语");
                },
                child: const Text("日语"),
              ),
              // const Divider(),
            ],
          );
        });

    log("-----------");
    log(result);
  }

  void _alertDialog() async {
    log(" show _alertDialog");
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息!"),
            content: const Text("您确定要删除吗"),
            actions: [
              TextButton(
                  onPressed: () {
                    _flutterToast("确定");
                    Navigator.of(context).pop("确定"); //点击按钮让AlertDialog消失
                  },
                  child: const Text("确定")),
              TextButton(
                  onPressed: () {
                    _flutterToast("取消");
                    Navigator.of(context).pop("取消");
                  },
                  child: const Text("取消"))
            ],
          );
        });

    log("-----------");
    log(result);
  }

  void _modelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text("分享"),
                  onTap: () {
                    _fToast("分享");
                    Navigator.of(context).pop("分享");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("收藏"),
                  onTap: () {
                    _fToast("收藏");
                    Navigator.of(context).pop("收藏");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("取消"),
                  onTap: () {
                    _fToast("取消");
                    Navigator.of(context).pop("取消");
                  },
                ),
                const Divider(),
              ],
            ),
          );
        });
    print(result);
  }

  void _flutterToast(String text) {
    fluttertoast.Fluttertoast.showToast(
        msg: text,
        toastLength: fluttertoast.Toast.LENGTH_LONG,
        //值针对 android 平台
        gravity: fluttertoast.ToastGravity.CENTER,
        //方位
        timeInSecForIosWeb: 1,
        //提示时间 针对ios 和 web
        backgroundColor: Colors.black,
        //背景颜色
        textColor: Colors.white,
        //文本颜色
        fontSize: 16.0 //文本字体大小
        );
  }

  void _fToast(String text) {
    ftoast.FToast.toast(context, msg: text);
  }
}

class CustomDialog extends Dialog{
  const CustomDialog({super.key});

  _showTimer(context){
    Timer.periodic(
        const Duration(milliseconds: 3000), (t) {
      Navigator.of(context).pop();
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
      type: MaterialType.transparency,//背景透明
      child: Container(//顶层的宽高无法限制，一定是整个屏幕的宽高
        alignment: Alignment.center,
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment(0,-0.5),
                child: Text(
                    "提示信息",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.5,0.5),
                child: ElevatedButton(
                  onPressed: (){
                    ftoast.FToast.toast(context, msg: "确定");
                    Navigator.pop(context);
                  },
                  child: const Text("确定"),
                ),
              ),
              Align(
                alignment: const Alignment(-0.5,0.5),
                child: ElevatedButton(
                  onPressed: (){
                    ftoast.FToast.toast(context, msg: "取消");
                    Navigator.pop(context);
                  },
                  child: const Text("取消"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
