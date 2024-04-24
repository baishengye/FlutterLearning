import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RefreshAndLoadMoreApp extends StatelessWidget {
  const RefreshAndLoadMoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("上拉加载和下拉刷新"),
        ),
        body: const NewsPage(),
      ),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ScrollController _scrollController = ScrollController(); //listview的控制器
  List _list = [];
  int _page = 1;

  _loadmoreData() async {
    String apiUri =
        "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
    var response = await Dio().get(apiUri);
    var result = json.decode(response.data);
    setState(() {
      _list.addAll(result["result"]);
      _page++;
    });
  }

  _refreshData() async {
    _page = 1;
    String apiUri =
        "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
    var response = await Dio().get(apiUri);
    var result = json.decode(response.data);
    setState(() {
      _list.addAll(result["result"]);
      _page++;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        _loadmoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _list.isNotEmpty
        ? RefreshIndicator(
            child: ListView(
              controller: _scrollController,
              children: _list.map((value) {
                return ListTile(
                  title: Text("${value["title"]}"),
                );
              }).toList(),
            ),
            onRefresh: () async {
              await _refreshData();
            })
        : const Center(child: CircularProgressIndicator());
  }
}
