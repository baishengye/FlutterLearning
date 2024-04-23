import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

String currentTime(){
  DateTime currentTime = DateTime.now();
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);
}

class FutureApp extends StatelessWidget {
  const FutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Future'),
          ),
          body: ListView(
              scrollDirection: Axis.vertical,
              semanticChildCount: 3,
              children: const [
                SizedBox(height: 20),
                FuturePage(),
                SizedBox(height: 20),
                FutureBuilderPage(),
                SizedBox(height: 20),
                StreamBuilderPage()
              ])),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  static Logger logger = Logger();

  Future<String> getStringNum() {
    return Future(() {
      //执行统计任务
      var num = 0;
      for (var i = 0; i < 10000; i++) {
        num += i;
      }
      return Future.delayed(const Duration(seconds: 2),(){
        logger.d("时间:${currentTime()}");
        return "result:$num";
      });
    });
  }

  int _counter = 0;

  void _incrementCounter() async {
    await getStringNum().then((value) {
      Future.delayed(const Duration(seconds: 2),(){
        logger.d("then#getStringNum时间:${currentTime()}");
      });
    }).onError((error, stackTrace) {
      Future.delayed(const Duration(seconds: 2),(){
        logger.d("onError#时间:${currentTime()}");
      });
    }).whenComplete(() {
      Future.delayed(const Duration(seconds: 2),(){
        logger.d("whenComplete#时间:${currentTime()}");
      });
    });
    logger.d("_incrementCounter时间:${currentTime()}");
    logger.d("---执行--");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.lightGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: _incrementCounter,
        child: Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key});

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  static Logger logger = Logger();
  Future<String> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    // throw "this is error";   //模拟错误
    return currentTime();
  }

  Stream<String> counter() {
    return Stream.periodic(const Duration(seconds: 1), (count) {
      return
        "${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
    });
  }

  @override
  void initState() {
    //获取异步方法Future里面的数据
    loadData().then((value) => logger.d(value));

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.deepPurpleAccent,
      alignment: Alignment.center,
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }
      )
    );
  }
}

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  static Logger logger = Logger();
  // final _controller = StreamController<String>();//单次发射的流是不能重复订阅的,
  //所以需要使用广播流
  final _controller = StreamController.broadcast(onListen:(){
    logger.d("广播流监听");
  }, onCancel: () {
    logger.d("广播流关闭");
  },sync:false);


  @override
  void dispose() {

    super.dispose();
    _controller.close();
  }

  Stream<String> counter() {
    return Stream.periodic(const Duration(seconds: 1), (count) {
      return currentTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.deepPurpleAccent,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Container(
            color: Colors.redAccent,
            child: StreamBuilder(
                stream: counter(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                      if(snapshot.hasData){
                        return Text(snapshot.data.toString());
                      } else if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }else{
                        return const Text("active");
                      }
                    case ConnectionState.done:
                      return const Text("done");
                    default:
                      return const Text("none");
                  }
                }
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.redAccent,
            child: StreamBuilder(
                stream: _controller.stream.where((event) => event != "").map((event) => "$event###123456").distinct(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                      if(snapshot.hasData){
                        return Text(snapshot.data.toString());
                      } else if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }else{
                        return const Text("active");
                      }
                    case ConnectionState.done:
                      return const Text("done");
                    default:
                      return const Text("none");
                  }
                }
            ),
          ),
          SizedBox(height: 20,),
          Wrap(
            children: [
              ElevatedButton(
                  onPressed: (){
                    _controller.add("add");
                  },
                  child: const Text("add")
              ),
              ElevatedButton(
                  onPressed: (){
                    _controller.close();
                  },
                  child: const Text("close")
              ),
              ElevatedButton(
                  onPressed: (){
                    _controller.addError("error");
                  },
                  child: const Text("Emit Error")
              ),
              ElevatedButton(
                  onPressed: (){
                    _controller.sink.close();
                  },
                  child: const Text("sink.close")
              ),
              ElevatedButton(
                  onPressed: (){
                    _controller.sink.add("sink.add");
                  },
                  child: const Text("sink.add")
              ),
            ],
          )
        ],
      )
    );
  }
}


