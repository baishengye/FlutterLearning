import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoApp extends StatelessWidget {
  const ChewieVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ChewieVideoPage());
  }
}

class ChewieVideoPage extends StatefulWidget {
  const ChewieVideoPage({super.key});

  @override
  State<ChewieVideoPage> createState() => _ChewieVideoPageState();
}

class _ChewieVideoPageState extends State<ChewieVideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initVideo();
  }

  _initVideo() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse("https://media.w3.org/2010/05/sintel/trailer.mp4")
    );
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      optionsBuilder: (context, defaultOptions) async {
        //defaultOptions保存了对应的按钮 先打印然后再去自定义
        return await showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 120,
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text("播放速度"),
                      onTap: () {
                        defaultOptions[0].onTap!();
                      },
                    ),
                    ListTile(
                      title: const Text("取消"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            });
      },
    );
  }

  /*销毁*/
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('在线视频播放'),
      ),
      body: Center(
          child: SizedBox(
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      )),
    );
  }
}
