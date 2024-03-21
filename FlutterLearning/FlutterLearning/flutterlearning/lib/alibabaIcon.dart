import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlibabaIconApp extends StatelessWidget {
  const AlibabaIconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello AlibabaIcon")),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            child: const Column(
              children: [
                Expanded(
                    flex: 1,
                    child: ClassIconWidget()
                ),
                Expanded(
                  flex: 1,
                  child: AlibabaIconWidget()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClassIconWidget extends StatelessWidget {
  const ClassIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.search, color: Colors.red, size: 40),
        SizedBox(height: 10),
        Icon(Icons.home),
        SizedBox(height: 10),
        Icon(Icons.category),
        SizedBox(height: 10),
        Icon(Icons.shop),
        SizedBox(height: 10),
      ],
    );
  }
}

class AlibabaIcons{
  // 验证码
  static const IconData code = IconData(
      0xe708,
      fontFamily: 'AlibabaIcon',
      matchTextDirection: true
  );
  // 打叉
  static const IconData cross = IconData(
      0xe607,
      fontFamily: 'AlibabaIcon',
      matchTextDirection: true
  );
  static const IconData phone = IconData(
      0xe68d,
      fontFamily: 'AlibabaIcon',
      matchTextDirection: true
  );
  static const IconData eye = IconData(
      0xe8bf,
      fontFamily: 'AlibabaIcon',
      matchTextDirection: true
  );
}

class AlibabaIconWidget extends StatelessWidget{
  const AlibabaIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(AlibabaIcons.phone, color: Colors.red, size: 40),
        SizedBox(height: 10),
        Icon(AlibabaIcons.code),
        SizedBox(height: 10),
        Icon(AlibabaIcons.cross),
        SizedBox(height: 10),
        Icon(AlibabaIcons.eye),
        SizedBox(height: 10),
      ],
    );
  }
}
