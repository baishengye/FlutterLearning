

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'Image.dart';

class ListViewApp extends StatelessWidget{
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello ListView"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 200,
              child: ListVerticalViewWidget(),
            ),
            const SizedBox(
              height: 200,
              child: CustomHorizontalListViewWidget(),
            ),
            const SizedBox(
              height: 200,
              child: ListViewBuilderWidget(),
            ),
            Expanded(
              flex: 1,
              child: ViewListBuilderWidget(),
            )
          ],
        )
      ),
    );
  }
}

class ListVerticalViewWidget extends StatelessWidget{
  const ListVerticalViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const <Widget>[
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          leading: ImageClipOvalNetWidget(),
        ),
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          leading: ImageClipOvalNetWidget(),
        ),
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          leading: ImageClipOvalNetWidget(),
        ),
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          leading: ImageClipOvalNetWidget(),
        ),
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          leading: ImageClipOvalNetWidget(),
        )
      ],
    );
  }
}


class CustomHorizontalListViewWidget extends StatelessWidget{
  const CustomHorizontalListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        ),
        SizedBox(
            width: 80,
            child:Column(
              children: <Widget>[
                ImageClipOvalNetWidget(),
                SizedBox(
                  child: Text("张三"),
                )
              ],
            )
        )
      ],
    );
  }
}

class ListViewBuilderWidget extends StatelessWidget{
  const ListViewBuilderWidget({super.key});

  List<Widget> _initListView() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(
          ListTile(
            title: Text("我是一个列表(ListViewBuilderWidget):$i"),
          )
      );
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListView(),
    );
  }
}

class ViewListBuilderWidget extends StatelessWidget{
  final List list = <String>[];
  ViewListBuilderWidget({super.key}){
    for(var i = 0;i<10;i++){
      list.add("我是一个列表(ViewListBuilderWidget):$i");
    }
  }

  get itemBuilder => ((context, index){
    return ListTile(
      title: Text("${list[index]}"),
    );
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:list.length,itemBuilder: itemBuilder);
  }
}