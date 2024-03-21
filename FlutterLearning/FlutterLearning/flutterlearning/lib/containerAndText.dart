
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerAndTextApp extends StatelessWidget{
  const ContainerAndTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "Hello ContainerAndText",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child:Container(
            alignment: Alignment.center,
            height: 100,
            width: 300,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            transform: Matrix4.rotationZ(0.2),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)
            ),
            child: const Text(
              "按钮牛牛牛牛牛牛牛牛牛按钮牛牛牛牛牛牛牛牛牛按钮牛牛牛牛牛牛牛牛牛按钮牛牛牛牛牛牛牛牛牛按钮牛牛牛牛牛牛牛牛牛",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.fade,
              textScaler: TextScaler.noScaling,
              maxLines: 1,
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                wordSpacing: 10,
                letterSpacing: -5,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ),
    );
  }

}