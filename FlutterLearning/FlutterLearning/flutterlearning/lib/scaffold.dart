import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Image.dart';

class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        title: "Scaffold Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> with SingleTickerProviderStateMixin {
  int _index = 0;
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          automaticallyImplyLeading: false,
          //隐藏默认的leading
          centerTitle: true,
          bottom: TabBar(controller: _tabController, tabs: const [
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("视频"))
          ]),
          actions: [
            //暂时没有找到隐藏这个的api
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.account_balance),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.pages),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ],
          backgroundColor: Colors.red,
          // leading: IconButton(
          //   icon: const Icon(Icons.account_balance),
          //   onPressed: () {
          //     Scaffold.of(context).openDrawer();
          //   },
          // ),
          title: const Text("Hello Scaffold"),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_createHome()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedIconTheme: const IconThemeData(color: Colors.amber),
        // selectedItemColor: Colors.deepPurple,
        selectedLabelStyle: const TextStyle(color: Colors.amber),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_sharp), label: "闹钟"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "家庭")
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: FloatingActionButton(
          backgroundColor: _index == 2 ? Colors.red : Colors.deepPurple,
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
          child: const Icon(Icons.settings),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355"),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("我来组成头部"),
              ),
            ),
          )
        ],
      )),
      endDrawer: const Drawer(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355"),
                      fit: BoxFit.cover)),
              accountName: Text("白生也"),
              accountEmail: Text("123456789@gmail.com"),
              currentAccountPicture: Icon(Icons.ac_unit_outlined),
              otherAccountsPictures: [
                Icon(Icons.access_alarm_rounded),
                ImageClipOvalNetWidget()
              ],
              otherAccountsPicturesSize: Size(50, 50),
            ),
          )
        ],
      )),
    );
  }

  Widget _createHome() {
    String string = "";
    if(_tabIndex==0){
      string = "热门";
    }else if(_tabIndex==1){
      string = "推荐";
    }else{
      string = "视频";
    }

    if (_index == 0) {
      return Container(
        alignment: Alignment.center,
        child: Text("首页:$string"),
      );
    } else if (_index == 1) {
      return Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("分类:${string}"),
        ),
      );
    } else if (_index == 2) {
      return Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          label: Text("设置:${string}"),
          icon: const Icon(Icons.settings),
        ),
      );
    } else if (_index == 3) {
      return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [Text("闹钟:$string"), const ImageClipOvalNetWidget()],
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [Text("家庭:$string"), const ImageClipOvalNetWidget()],
        ),
      );
    }
  }
}
