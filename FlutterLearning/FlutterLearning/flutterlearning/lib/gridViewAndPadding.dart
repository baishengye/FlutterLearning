import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Image.dart';

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello GridView"),
          ),
          body: const Column(
            children: [
              Expanded(
                child: CountGridView(),
              ),
              Expanded(child: ExtentGridView()),
              Expanded(child: BuilderGridView())
            ],
          )),
    );
  }
}

class CountGridView extends StatelessWidget {
  const CountGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      children: const [
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
      ],
    );
  }
}

class ExtentGridView extends StatelessWidget {
  const ExtentGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 80,
      childAspectRatio: 1.0,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      children: const [
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
        ImageClipOvalNetWidget(),
      ],
    );
  }
}

class BuilderGridView extends StatelessWidget {
  const BuilderGridView({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.network("https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355", fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          const Text(
            "Fate你是我的神",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
// height: 400, //设置高度没有反应
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   maxCrossAxisExtent: 300,
      // ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10.0, //水平子 Widget 之间间距
        mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
        crossAxisCount: 2, //一行的 Widget 数量
      ),
      itemCount: 50,
      itemBuilder: _getListData,
    );
  }
}
