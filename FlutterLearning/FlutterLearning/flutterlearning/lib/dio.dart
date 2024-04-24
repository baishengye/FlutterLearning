import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DioApp extends StatelessWidget {
  const DioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dio'),
        ),
        body: ListView(
          children: const [
            SizedBox(height: 20),
            DioSimplePage(),
            SizedBox(height: 20),
            CategoryPage(),
            SizedBox(height: 20),
            MessagePage()
          ],
        ),
      ),
    );
  }
}

class DioSimplePage extends StatefulWidget {
  const DioSimplePage({super.key});

  @override
  State<DioSimplePage> createState() => _DioSimplePageState();
}

class _DioSimplePageState extends State<DioSimplePage> {
  final Logger logger = Logger();

  _getData() async {
    var response = await Dio().get('https://jdmall.itying.com/api/httpGet',
        queryParameters: {"username": "zhangsan"});
    logger.d(response.data);
  }

  _postData() async {
    var response = await Dio().post('https://jdmall.itying.com/api/httpPost',
        data: {"username": "张三111", "age": "20"});
    logger.d(response.data);
  }

  _putData() async {
    var response = await Dio().put('https://jdmall.itying.com/api/httpPut',
        data: {"username": "张三111", "age": "20"});
    logger.d(response.data);
  }

  _deleteData() async {
    var response = await Dio().delete(
        'https://jdmall.itying.com/api/httpDelete',
        queryParameters: {"id": "1"});
    logger.d(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Wrap(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _getData();
                  },
                  child: const Text("dio get请求")),
              ElevatedButton(
                  onPressed: () {
                    _postData();
                  },
                  child: const Text("dio post请求")),
              ElevatedButton(
                  onPressed: () {
                    _putData();
                  },
                  child: const Text("dio put请求")),
              ElevatedButton(
                  onPressed: () {
                    _deleteData();
                  },
                  child: const Text("dio delete"))
            ],
          )
        ],
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final Logger logger = Logger();
  List _list = [];

  _getCateList() async {
    setState(() {
      _list = [];
    });
    var response = await Dio().get("https://jdmall.itying.com/api/pcate");
    // return result.data;
    logger.d(response.data);
    setState(() {
      _list = response.data["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _list.isNotEmpty
                  ? ListView(
                children: _list.map((value) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(value["title"]),
                      ),
                      const Divider()
                    ],
                  );
                }).toList(),
              )
                  : const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _getCateList();
                },
                child: const Text("获取数据"))
          ],
        )
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});
  @override
  State<MessagePage> createState() => _MessagePageState();
}


class _MessagePageState extends State<MessagePage> {

  final Logger logger = Logger();

  _getCateList() async {
    var response = await Dio().get("https://jdmall.itying.com/api/pcate");
    logger.d(response);
    return response.data["result"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      height: 200,
      child: FutureBuilder(
          future: _getCateList(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }else{
                return ListView(
                  children: (snapshot.data as List).map((value){
                    return Column(
                      children: [
                        ListTile(
                          title: Text(value["title"]),
                        ),
                        const Divider()
                      ],
                    );
                  }).toList(),
                );
              }
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
