import 'package:flutter/material.dart';

class AnimationControllerApp extends StatelessWidget {
  const AnimationControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AnimationController"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: ListView(scrollDirection: Axis.vertical, children: const [
              SizedBox(
                  height: 20, child: Text("显示动画:AnimationController,Tween")),
              AnimationControllerPage(),
              SizedBox(height: 20),
              AnimationIconPage(),
              SizedBox(height: 20),
              TweenAnimationBuilderAnimatedPage(),
              SizedBox(height: 20),
              TweenAnimationBuilderAnimationPage()
            ])),
      ),
    );
  }
}

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({super.key});

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: 1.0,
        vsync: this,
        //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂
        //直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保
        //持同步，以达到供需平衡的效果，防止卡顿现象
        duration: const Duration(seconds: 2),
        lowerBound: 0.0,
        //第三圈转到第五圈
        upperBound: 1.0);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0)
                  .chain(CurveTween(curve: Curves.ease))
                  .chain(CurveTween(
                      curve: const Interval(0.4, 0.6))) //最后的百分之20的时间完成动画
                  .animate(_controller),
              child: FadeTransition(
                opacity: Tween(begin: 0.5, end: 1.0)
                    .chain(CurveTween(curve: Curves.ease))
                    .chain(CurveTween(
                        curve: const Interval(0.8, 1.0))) //最后的百分之20的时间完成动画
                    .animate(_controller),
                child: ScaleTransition(
                  scale: _controller.drive(Tween(begin: 0.5, end: 1.0)),
                  child: SlideTransition(
                    position: Tween(
                            begin: const Offset(0.0, 0.0),
                            end: const Offset(3.0, 0))
                        .chain(CurveTween(curve: Curves.ease))
                        .chain(CurveTween(
                            curve: const Interval(0.6, 0.8))) //最后的百分之20的时间完成动画
                        .animate(_controller),
                    child: const FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
              )),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _controller.forward(); //正序播放一次
                },
                child: const Text("正序")),
            ElevatedButton(
                onPressed: () {
                  _controller.reverse(); //倒序播放一次
                },
                child: const Text("逆序")),
            ElevatedButton(
                onPressed: () {
                  _controller.stop(); //停止播放
                },
                child: const Text("停止")),
            ElevatedButton(
                onPressed: () {
                  _controller.reset(); //重置
                },
                child: const Text("重置")),
            ElevatedButton(
                onPressed: () {
                  _controller.repeat(); //重复播放
                },
                child: const Text("重复"))
          ],
        )
      ],
    );
  }
}

class AnimationIconPage extends StatefulWidget {
  const AnimationIconPage({super.key});

  @override
  State<AnimationIconPage> createState() => _AnimationIconPageState();
}

class _AnimationIconPageState extends State<AnimationIconPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: 0.0,
        vsync: this,
        //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂
        //直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保
        //持同步，以达到供需平衡的效果，防止卡顿现象
        duration: const Duration(seconds: 2),
        lowerBound: 0.0,
        //第三圈转到第五圈
        upperBound: 1.0);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: AnimatedIcon(
              icon: AnimatedIcons.menu_close, progress: _controller, size: 40),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _controller.forward(); //正序播放一次
                },
                child: const Text("正序")),
            ElevatedButton(
                onPressed: () {
                  _controller.reverse(); //倒序播放一次
                },
                child: const Text("逆序")),
            ElevatedButton(
                onPressed: () {
                  _controller.stop(); //停止播放
                },
                child: const Text("停止")),
            ElevatedButton(
                onPressed: () {
                  _controller.reset(); //重置
                },
                child: const Text("重置")),
            ElevatedButton(
                onPressed: () {
                  _controller.repeat(); //重复播放
                },
                child: const Text("重复"))
          ],
        )
      ],
    );
  }
}

class TweenAnimationBuilderAnimatedPage extends StatefulWidget {
  const TweenAnimationBuilderAnimatedPage({super.key});

  @override
  State<TweenAnimationBuilderAnimatedPage> createState() =>
      _TweenAnimationBuilderAnimatedPageState();
}

class _TweenAnimationBuilderAnimatedPageState
    extends State<TweenAnimationBuilderAnimatedPage>
    with SingleTickerProviderStateMixin {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: flag ? 0.2 : 1.0),
                duration: const Duration(seconds: 1),
                builder: ((context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Icon(
                      Icons.star,
                      size: 80 * value,
                    ),
                  );
                })),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              },
              child: const Text("自定义隐式动画"))
        ]);
  }
}

class TweenAnimationBuilderAnimationPage extends StatefulWidget {
  const TweenAnimationBuilderAnimationPage({super.key});

  @override
  State<TweenAnimationBuilderAnimationPage> createState() =>
      _TweenAnimationBuilderAnimationPagePageState();
}

class _TweenAnimationBuilderAnimationPagePageState
    extends State<TweenAnimationBuilderAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: 0.0,
        vsync: this,
        //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂
        //直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保
        //持同步，以达到供需平衡的效果，防止卡顿现象
        duration: const Duration(seconds: 2),
        lowerBound: 0.0,
        //第三圈转到第五圈
        upperBound: 1.0)
      ..repeat(reverse: false)
      ..stop();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation x = Tween(begin: -100.0, end: 100.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .chain(CurveTween(curve: const Interval(0.2, 0.4)))
        .animate(_controller);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                    opacity: _controller.value,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                      transform: Matrix4.translationValues(x.value, 0, 0),
                      child: child,
                    )
                );
              },
              child: const Text("自定义AnimatedBuilder"),
            ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _controller.forward(); //正序播放一次
                },
                child: const Text("正序")),
            ElevatedButton(
                onPressed: () {
                  _controller.reverse(); //倒序播放一次
                },
                child: const Text("逆序")),
            ElevatedButton(
                onPressed: () {
                  _controller.stop(); //停止播放
                },
                child: const Text("停止")),
            ElevatedButton(
                onPressed: () {
                  _controller.reset(); //重置
                },
                child: const Text("重置")),
            ElevatedButton(
                onPressed: () {
                  _controller.repeat(); //重复播放
                },
                child: const Text("重复"))
          ],
        )
      ],
    );
  }
}
