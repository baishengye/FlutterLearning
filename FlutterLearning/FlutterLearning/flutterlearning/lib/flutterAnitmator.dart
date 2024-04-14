import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterAnimatorApp extends StatelessWidget {
  const FlutterAnimatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Animation"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              AnimationContainerPage(),
              SizedBox(width: double.infinity, height: 20),
              AnimationPaddingPage(),
              SizedBox(width: double.infinity, height: 20),
              AnimatedPositionedPage(),
              SizedBox(width: double.infinity, height: 20),
              AnimatedOpacityPage(),
              SizedBox(width: double.infinity, height: 20),
              AnimatedDefaultTextStylePage(),
              SizedBox(width: double.infinity, height: 20),
              AnimatedSwitcherPage(),
              SizedBox(width: double.infinity, height: 20),
              AnimatedSwitcherChildPage()
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationContainerPage extends StatefulWidget {
  const AnimationContainerPage({super.key});

  @override
  State<AnimationContainerPage> createState() => _AnimationContainerPageState();
}

class _AnimationContainerPageState extends State<AnimationContainerPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      // 动画时长500 ms
      curve: Curves.easeInBack,
      width: double.infinity,
      height: flag ? 100 : 200,
      padding: EdgeInsets.fromLTRB(flag ? 10 : 100, 0, flag ? 10 : 100, 0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            "AnimatedContainer动画",
          ),
        ),
      ),
    );
  }
}

class AnimationPaddingPage extends StatefulWidget {
  const AnimationPaddingPage({super.key});

  @override
  State<AnimationPaddingPage> createState() => _AnimationPaddingState();
}

class _AnimationPaddingState extends State<AnimationPaddingPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 1000), // 动画时长500 ms
        curve: Curves.bounceOut,
        padding: EdgeInsets.fromLTRB(
            flag ? 10 : 100, flag ? 0 : 20, flag ? 10 : 100, flag ? 0 : 20),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "AnimatedPadding动画",
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.linearToEaseOut,
            duration: const Duration(seconds: 1),
            top: flag ? 0 : 50,
            left: flag ? 0 : 100,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  "AnimatedPositioned动画",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//这个动画只是修改了透明度，但是控件还是存在的，点击事件都是存在的
class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: AnimatedOpacity(
        curve: Curves.linear,
        duration: const Duration(seconds: 1),
        opacity: flag ? 1 : 0,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "AnimatedOpacity动画",
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedDefaultTextStylePage extends StatefulWidget {
  const AnimatedDefaultTextStylePage({super.key});

  @override
  State<AnimatedDefaultTextStylePage> createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: TextStyle(
                fontSize: flag ? 15 : 25,
                color: flag ? Colors.deepPurple : Colors.deepOrange),
            child: const Text("AnimatedDefaultTextStyle动画"),
          ),
        ),
      ),
    );
  }
}

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  State<AnimatedSwitcherPage> createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            transitionBuilder: ((child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }),
            duration: const Duration(milliseconds: 3000),
            child: flag
                ? Image.network(
                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F615558d3-9a39-497c-be1e-5c5bd04a885b%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1715182284&t=1fb965158d2239046f362d46dbe2efb3",
                    key: const ValueKey(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F615558d3-9a39-497c-be1e-5c5bd04a885b%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1715182284&t=1fb965158d2239046f362d46dbe2efb3"),
                    fit: BoxFit.contain,
                  )
                : Image.network(
                    "https://tva3.sinaimg.cn/mw1024/006yt1Omgy1h35v6igwt5j34jt35chdt.jpg",
                    key: const ValueKey(
                        "https://tva3.sinaimg.cn/mw1024/006yt1Omgy1h35v6igwt5j34jt35chdt.jpg"),
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
    );
  }
}

class AnimatedSwitcherChildPage extends StatefulWidget {
  const AnimatedSwitcherChildPage({super.key});

  @override
  State<AnimatedSwitcherChildPage> createState() =>
      _AnimatedSwitcherPageChildState();
}

class _AnimatedSwitcherPageChildState extends State<AnimatedSwitcherChildPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            transitionBuilder: ((child, animation) {
              return  ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child:child ,
                ),
              );
            }),
            duration: const Duration(milliseconds: 3000),
            child: Text(
              key: UniqueKey(),
              flag ? "动画" : "隐式",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
