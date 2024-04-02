
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationListApp extends StatelessWidget {
  const AnimationListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationListPage(),
    );
  }
}


class AnimationListPage extends StatefulWidget {
  const AnimationListPage({super.key});

  @override
  State<AnimationListPage> createState() => _AnimationListPageState();
}

class _AnimationListPageState extends State<AnimationListPage> {
  final globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ["第一条数据","第二条数据"];
  var removing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello AnimationList"),
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            setState(() {
              list.add("第${list.length}条数据");
              globalKey.currentState?.insertItem(list.length-1,duration: const Duration(seconds: 1));
            });
          },
          child: const Icon(Icons.settings),
        ),
      ),
      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        itemBuilder: (context,index,animation){
        return ScaleTransition(
          scale: animation,
          child: _buildItem(context,index),
        );
      }),
    );
  }

  Widget _buildItem(context, index) {
    return Card(
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
        child: ElevatedButton(
          key: ValueKey(index),
          onPressed: ()=>_deleteItem(context, index),
          child: Text(list[index]),
        ),
      ),
    );
  }

  _deleteItem(context, index) {
    if(removing == true) return;
    removing = true;
    setState(() {
      //  删除过程执行的是反向动画，animation.value 会从1变为0
      globalKey.currentState!.removeItem(index, (context, animation) {
        //注意先build然后再去删除
        var item = _buildItem(context, index);
        list.removeAt(index);
        return FadeTransition(
          opacity: animation,
          child: item,
        );
      },duration: const Duration(seconds: 1));
      Timer(const Duration(seconds: 1), () {
        removing = false;
      });
    });
  }
}
