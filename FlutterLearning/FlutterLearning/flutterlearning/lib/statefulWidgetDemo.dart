
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulWidgetApp extends StatelessWidget{
  const StatefulWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello StatefulWidget Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello StatefulWidget"),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              count ++ ;
            });
          },
          child: Text("$count"),
        ),
      ),
    );
  }
}