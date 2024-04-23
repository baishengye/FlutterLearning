import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

String currentTime(){
  DateTime currentTime = DateTime.now();
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);
}

class AsyncApp extends StatelessWidget {
  const AsyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Async Async*"),
        ),
        body: ListView(
          children: const [
            SizedBox(height: 20),
            AsyncStarPage(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AsyncStarPage extends StatefulWidget {
  const AsyncStarPage({super.key});

  @override
  State<AsyncStarPage> createState() => _AsyncStarPageState();
}

class _AsyncStarPageState extends State<AsyncStarPage> {
  static Logger logger = Logger();
  // 定义一个类型为int的Stream
  Stream<int> countForOneMinute() async* {
    for (int i = 1; i <= 60; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: Colors.greenAccent,
      child:  StreamBuilder(
          stream: countForOneMinute(),
          builder: (context, snapshot) {
            // 观察ConnectionState的状态
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text("NONE: 没有数据流"),
                );
              case ConnectionState.waiting:
                return const Center(child: Text("WAITING: 等待数据流"));
              case ConnectionState.active:
                if (snapshot.hasError) {
                  return Center(
                      child: Text("ACTIVE: 数据流活跃，异常: ${snapshot.error}"));
                } else {
                  return Center(
                      child: Text("ACTIVE: 数据流活跃，数据: ${snapshot.data}"));
                }
              case ConnectionState.done:
                return const Center(child: Text("DONE: 数据流关闭"));
              default:
                throw "ConnectionState没有别的状态";
            }
          }),
    );
  }
}

