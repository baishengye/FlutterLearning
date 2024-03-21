import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterApp extends StatelessWidget {
  const RouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map routes = {
      "/":(context) => const FirstPage(),
      "/secondPage":(context)=>const SecondPage(),
      "/thirdPage":(context,{arguments}) => ThirdPage(arguments: arguments)
    };
    return MaterialApp(
      // home: FirstPage(),
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        // 统一处理
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstPage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const SecondPage(title: "当前时SecondPage",);
            }));
          },
          child: const Text("跳转到SecondPage"),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String title;
  const SecondPage({super.key,this.title = "SecondPage"});

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/thirdPage",arguments: {
                  "title": "命名路由带参数跳转到secondPage"
                });
              },
              child: const Text("命名路由跳转到ThirdPage"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回上一页"),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final Map arguments;
  const ThirdPage({super.key,required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/secondPage");//跳转的同时销毁当前页面
              },
              child: const Text("跳转到SecondPage"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回上一页"),
            )
          ],
        ),
      ),
    );
  }
}

