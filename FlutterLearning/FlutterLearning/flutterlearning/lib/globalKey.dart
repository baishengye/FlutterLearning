import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

import 'Key.dart';

class GlobalKeyApp extends StatelessWidget {
  const GlobalKeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlobalKeyPage(),
    );
  }
}

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({super.key});

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {

  final key1 = GlobalKey();
  final key2 = const GlobalObjectKey(Colors.indigoAccent);
  final key3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello GlobalKey触发子控件的变化"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          FToast.toast(context,msg:(key1.currentWidget as BoxWidget).color.toString());
          setState(() {
            (key1.currentState as _BoxWidgetState)._count ++;
            (key2.currentState as _BoxWidgetState)._count += 2;
            (key3.currentState as _BoxWidgetState)._count += 3;
          });
        },
        child: const Icon(Icons.settings),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            BoxWidget(key: key1,color: Colors.orange),
            BoxWidget(key: key2,color: Colors.indigoAccent),
            BoxWidget(key: key3,color: Colors.redAccent)
          ],
        ),
      ),
    );
  }
}



class BoxWidget extends StatefulWidget {
  Color color;
  BoxWidget({super.key,required this.color});

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),//ElevatedButton默认有内边距，建议取消内边距保证居中
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(widget.color)
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text(
          "$_count",
          style: const TextStyle(
              fontSize: 10
          ),
        ),
      ),
    );
  }
}