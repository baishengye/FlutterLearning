import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget{
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "Hello Image",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              Expanded(
                flex: 1,
                child: ImageClipOvalNetWidget()
              ),
              Expanded(
                  flex: 1,
                  child: ImageContainerNetWidget()
              ),
              Expanded(
                  flex: 1,
                  child: ImageCircleAvatarLocalWidget()
              )
            ],
          )
          // child: const ImageContainerNetWidget(),
          // child: const ImageCircleAvatarLocalWidget(),
        ),
      ),
    );
  }
}

class ImageClipOvalNetWidget extends StatelessWidget{
  const ImageClipOvalNetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355",
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageContainerNetWidget extends StatelessWidget{
  const ImageContainerNetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(75),
        image: const DecorationImage(
            image: NetworkImage(
              "https://img1.baidu.com/it/u=2331870304,4138487729&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=355",
            ),
            fit: BoxFit.cover
        )
      ),
    );
  }
}

class ImageCircleAvatarLocalWidget extends StatelessWidget{
  const ImageCircleAvatarLocalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 110,
      backgroundColor: Colors.deepPurple,
      child:  CircleAvatar(
        radius: 100,
        child: Image.asset(
          "images/a.jpeg",
          width: 300.0,
          height: 300.0,
          fit: BoxFit.cover
        ),
      ),
    );
  }
}