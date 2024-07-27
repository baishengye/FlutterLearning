import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomishop/app/utils/keep_alive_wrapper.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepALiveWrapper(
        keepLive: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              children: [
                TextButton(onPressed: (){}, child: Text("1")),
                TextButton(onPressed: (){}, child: Text("2")),
                TextButton(onPressed: (){}, child: Text("3")),
                TextButton(onPressed: (){}, child: Text("4")),
                TextButton(onPressed: (){}, child: Text("5")),
                TextButton(onPressed: (){}, child: Text("6")),
                TextButton(onPressed: (){}, child: Text("7")),
                TextButton(onPressed: (){}, child: Text("8")),
                TextButton(onPressed: (){}, child: Text("9")),
                TextButton(onPressed: (){}, child: Text("10")),
                TextButton(onPressed: (){}, child: Text("11")),
                TextButton(onPressed: (){}, child: Text("12")),
                TextButton(onPressed: (){}, child: Text("13")),
                TextButton(onPressed: (){}, child: Text("14")),
                TextButton(onPressed: (){}, child: Text("15")),
                TextButton(onPressed: (){}, child: Text("16")),
                TextButton(onPressed: (){}, child: Text("17")),
                TextButton(onPressed: (){}, child: Text("18")),
                TextButton(onPressed: (){}, child: Text("19")),
                TextButton(onPressed: (){}, child: Text("20")),
                TextButton(onPressed: (){}, child: Text("21")),
                TextButton(onPressed: (){}, child: Text("22")),
              ],
            ),
          ),
        ),
    );
  }
}
