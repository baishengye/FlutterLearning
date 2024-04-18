// hero动画

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:photo_view/photo_view.dart';

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map routes = {
      "/": (context) => const HeroFirstPage(),
      "/heroSecondPage": (context, {arguments}) =>
          HeroSecondPage(arguments: arguments)
    };

    return MaterialApp(
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          // 统一处理
          final String? name = settings.name;
          final Function? pageContentBuilder = routes[name];
          if (pageContentBuilder != null) {
            if (settings.arguments != null) {
              final Route route = CupertinoPageRoute(
                  builder: (context) => pageContentBuilder(context,
                      arguments: settings.arguments));
              return route;
            } else {
              final Route route = CupertinoPageRoute(
                  builder: (context) => pageContentBuilder(context));
              return route;
            }
          }
          return null;
        });
  }
}

class HeroFirstPage extends StatefulWidget {
  const HeroFirstPage({super.key});

  @override
  State<HeroFirstPage> createState() => _HeroFirstPageState();
}

class _HeroFirstPageState extends State<HeroFirstPage> {
  List listData = [
    {
      "imageUrl":
          "https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355",
      "description": "图片1"
    },
    {
      "imageUrl":
          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201602%2F02%2F20160202154943_hScMN.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1713796785&t=35e6074fdf10d18e7f870a2c5b57c10d",
      "description": "图片2"
    },
    {
      "imageUrl":
          "https://lmg.jj20.com/up/allimg/1111/09141Q21018/1P914121018-5-1200.jpg",
      "description": "图片3"
    },
    {
      "imageUrl":
          "https://lmg.jj20.com/up/allimg/4k/s/01/21092415213S229-0-lp.jpg",
      "description": "图片4"
    }
  ];

  List<Widget> _getListData(context) {
    var widgetMap = listData.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/heroSecondPage", arguments: {
            "imageUrl": value["imageUrl"],
            "description": value["description"],
          });
        },
        child: Hero(
          tag: value["imageUrl"],
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(value["imageUrl"],
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value["description"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
// height: 400, //设置高度没有反应
          ),
        ),
      );
    });
    return widgetMap.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hero动画"),
        ),
        body: GridView.count(
          crossAxisSpacing: 10.0,
          //水平子 Widget 之间间距
          mainAxisSpacing: 10.0,
          //垂直子 Widget 之间间距
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          //一行的 Widget 数量
          // childAspectRatio:0.7,  //宽度和高度的比例
          children: _getListData(context),
        ));
  }
}

class HeroSecondPage extends StatefulWidget {
  final Map arguments;

  const HeroSecondPage({super.key, required this.arguments});

  @override
  State<HeroSecondPage> createState() => _HeroSecondPageState();
}

class _HeroSecondPageState extends State<HeroSecondPage> {
  @override
  void initState() {
    super.initState();
    timeDilation = 2.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情页面"),
      ),
      //   body: ListView(
      //     children: [
      //       Hero(
      //           tag: widget.arguments["imageUrl"],
      //           child: PhotoView(
      //             imageProvider: NetworkImage(widget.arguments["imageUrl"]),
      //           )
      // ),
      //       const SizedBox(height: 20),
      //       Padding(
      //         padding: const EdgeInsets.all(5),
      //         child: Text(widget.arguments["description"],
      //             style: const TextStyle(fontSize: 22)),
      //       )
      //     ],
      //   ),
      body: Hero(
          tag: widget.arguments["imageUrl"],
          child: PhotoView(
            imageProvider: NetworkImage(widget.arguments["imageUrl"]),
          )),
    );
  }
}
