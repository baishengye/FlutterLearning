

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardApp extends StatelessWidget{
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Card"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              Card(
                margin: const EdgeInsets.all(20),
                elevation: 20,
                color: Colors.deepPurple,
                shadowColor: Colors.red,
                clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                elevation: 20,
                color: Colors.deepPurple,
                shadowColor: Colors.red,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 50))
                ),
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                elevation: 20,
                color: Colors.deepPurple,
                shadowColor: Colors.red,
                clipBehavior: Clip.hardEdge,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}