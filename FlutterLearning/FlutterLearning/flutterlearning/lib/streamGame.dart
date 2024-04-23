import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamGameApp extends StatelessWidget {
  const StreamGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stream Game",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamGamePage(),
    );
  }
}

class StreamGamePage extends StatefulWidget {
  const StreamGamePage({super.key});

  @override
  State<StreamGamePage> createState() => _StreamGamePageState();
}

class _StreamGamePageState extends State<StreamGamePage> {
  int score = 0;
  final StreamController<int> _scoreController = StreamController.broadcast();
  final StreamController<int> _inputController = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: StreamBuilder(
              stream: _scoreController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error:${snapshot.error}");
                }
                if (snapshot.hasData) {
                  score = score + (snapshot.data as int);
                  return Text("得分：$score");
                }
                return const Text("等待输入");
              })),
      body: Stack(
        children: [
          ...List.generate(3, (index) {
            return TipPage(
                inputController: _inputController,
                scoreController: _scoreController);
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: KeyPadPage(controller: _inputController),
          )
        ],
      ),
    );
  }
}

class TipPage extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;

  const TipPage(
      {super.key,
      required this.inputController,
      required this.scoreController});

  @override
  State<TipPage> createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> with SingleTickerProviderStateMixin {
  late int a, b;
  late Color color;
  late double x;
  late AnimationController _animationController;

  void reset() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 300 + 20;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    // _animationController.duration=Duration(microseconds:Random().nextInt(5000)+5000;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: Random().nextInt(5) + 12));
    reset();
    _animationController.forward();
    //监听_animationController完毕后让重新开始
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0.0);
        reset();
        widget.scoreController.add(-1);
      }
    });
    widget.inputController.stream.listen((event) {
      if (event == a + b) {
        reset();
        _animationController.forward(from: 0.0);
        widget.scoreController.add(3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
              left: x,
              top: Tween(begin: -10.0, end: 500.0)
                  .animate(_animationController)
                  .value,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
                child: Text("$a+$b=?"),
              ));
        }
    );
  }
}

//键盘子组件
class KeyPadPage extends StatelessWidget {
  final StreamController<int> controller;
  const KeyPadPage({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true, //收缩
        physics: const NeverScrollableScrollPhysics(), //去掉ios中反弹效果
        childAspectRatio: 5 / 3,
        children: List.generate(9, (index) {
          return TextButton(
              style: ButtonStyle(
                  shape:
                  MaterialStateProperty.all(const RoundedRectangleBorder()),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.primaries[index][400])),
              onPressed: () {
                controller.add(index + 1);
              },
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontSize: 26),
              ));
        }),
      ),
    );
  }
}
