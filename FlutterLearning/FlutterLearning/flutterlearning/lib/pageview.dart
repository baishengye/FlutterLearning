import 'dart:async';

import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget {
  const PageViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Hello PageView"),
            ),
            body: const Column(children: [
              Expanded(
                flex: 1,
                child: PageViewPage(),
              ),
              Expanded(
                flex: 3,
                child: PageViewOtherPage(),
              )
            ])));
  }
}

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  List<KeepAliveWrapper> bannerList = [];

  @override
  void initState() {
    super.initState();

    List listData = [
      {
        "imageUrl":
            "https://p4.itc.cn/images01/20210526/d375d143cbbc4b798399e726a586152d.jpeg"
      },
      {
        "imageUrl":
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201602%2F02%2F20160202154943_hScMN.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1713796785&t=35e6074fdf10d18e7f870a2c5b57c10d"
      },
      {
        "imageUrl":
            "https://lmg.jj20.com/up/allimg/1111/09141Q21018/1P914121018-5-1200.jpg"
      },
      {
        "imageUrl":
            "https://lmg.jj20.com/up/allimg/4k/s/01/21092415213S229-0-lp.jpg"
      }
    ];
    for (var element in listData) {
      bannerList.add(KeepAliveWrapper(
        child: BannerWidget(imageUrl: element["imageUrl"]),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwiperWidget(
      bannerList: bannerList,
    );
  }
}

class SwiperWidget extends StatefulWidget {
  final List<Widget> bannerList;

  const SwiperWidget({super.key, required this.bannerList});

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  int _currIndex = 0;
  late PageController _pageController;

  static const timeout = Duration(seconds: 3);
  static const time = Duration(milliseconds: 700);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.bannerList.length * 500);
    timer = Timer.periodic(timeout, (timer) {
      _pageController.nextPage(duration: time, curve: Curves.easeInOutQuint);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: 200,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currIndex = index % widget.bannerList.length;
            });
          },
          itemCount: widget.bannerList.length * 1000,
          itemBuilder: (context, index) {
            return widget.bannerList[index % widget.bannerList.length];
          },
        ),
      ),
      Positioned(
          bottom: 35,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.bannerList.length, (i) {
              return Container(
                margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currIndex == i ? Colors.blue : Colors.grey),
              );
            }).toList(),
          ))
    ]);
  }
}

class BannerWidget extends StatefulWidget {
  final String imageUrl;

  const BannerWidget({super.key, required this.imageUrl});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({Key? key, required this.child, this.keepAlive = true})
      : super(key: key);
  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
//这里使用covariant协变关键字,感兴趣可以研究一下dart  covariant

class PageViewOtherPage extends StatefulWidget {
  const PageViewOtherPage({super.key});

  @override
  State<PageViewOtherPage> createState() => _PageViewOtherPageState();
}

class _PageViewOtherPageState extends State<PageViewOtherPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      children: [
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubicEmphasized);
            },
            child: const Text(
              "0",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut);
            },
            child: const Text(
              "1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1), curve: Curves.linear);
            },
            child: const Text(
              "2",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.linearToEaseOut);
            },
            child: const Text(
              "3",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.linearToEaseOut);
            },
            child: const Text(
              "4",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack);
            },
            child: const Text(
              "5",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
