
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget{
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "hello flutter",
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: MainPage(),
      ),
    );
  }

}

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello Flutter",
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          color: Color.fromARGB(100,1, 1, 1)
        ),
      ),
    );
  }
}