import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gridViewAndPadding.dart';

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Stack Align Positioned"),
        ),
        body: const Column(
          children: [
            Expanded(
              flex: 1,
              child: StackAndAlignWidget(),
            ),
            Expanded(
              flex: 2,
              child: StackAndPositionedWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class StackAndAlignWidget extends StatelessWidget {
  const StackAndAlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
              alignment: const Alignment(1, 1),
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
              )),
          const Align(
            alignment: Alignment(1, 0),
            child: Icon(
              Icons.access_alarm,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}

class StackAndPositionedWidget extends StatelessWidget {
  const StackAndPositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepPurpleAccent,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const BuilderGridView(),
          Positioned(//
            top: 40,
            left: 0,
            width: size.width,
            child: AspectRatio(
              aspectRatio: 4.0 / 1.0,//宽高比例
              child: Container(
                width: size.width,
                color: Colors.amber,
                alignment: Alignment.center,
                child: const Text("Hello Positioned"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
