
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAndColumnApp extends StatelessWidget{
  const RowAndColumnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Row Column double.infinity Expanded"),
        ),
        body: Container(
          width: 400,
          height: 600,
          alignment: Alignment.center,
          color: Colors.redAccent,
          child: SizedBox(
            width: double.infinity,//不写或者写double.infinity可以占满父布局
            height: double.infinity,
            child: Row(//行布局
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.deepPurple,
                  ),
                ),
                Expanded(
                    flex: 2,//所占比例
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black,
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.green,
                            )
                        )
                      ]
                    )
                )
              ]
            )
          )
        )
      )
    );
  }
}