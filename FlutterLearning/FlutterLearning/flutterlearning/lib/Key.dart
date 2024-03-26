
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyApp extends StatelessWidget {
  const KeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppContainerWidget(),
    );
  }
}

class AppContainerWidget extends StatefulWidget {
  const AppContainerWidget({super.key});

  @override
  State<AppContainerWidget> createState() => _AppContainerWidgetState();
}

class _AppContainerWidgetState extends State<AppContainerWidget> {
  List<Widget> boxListNoKey = [
    const BoxWidget(color: Colors.orange),
    const BoxWidget(color: Colors.indigoAccent),
    const BoxWidget(color: Colors.redAccent)
  ];
  List<Widget> boxListHasLocalKey = [
    const BoxWidget(key: ValueKey(Colors.orange),color: Colors.orange),
    BoxWidget(key: UniqueKey(), color : Colors.indigoAccent),
    const BoxWidget(key: ObjectKey(Colors.redAccent), color : Colors.redAccent)
  ];

  List<Widget> boxListHasGlobalKey = [
    const BoxWidget(key: GlobalObjectKey(Colors.orange),color: Colors.orange),
    BoxWidget(key: GlobalKey(), color : Colors.indigoAccent),
    BoxWidget(key: GlobalKey(), color : Colors.redAccent)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Hello Key")
      ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              setState(() {
                boxListNoKey.shuffle();
                boxListHasLocalKey.shuffle();
                boxListHasGlobalKey.shuffle();
              });
            },
            child: const Icon(Icons.settings),
          ),
        ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // Expanded(
            //   flex: 1,
            //   child:Stack(
            //     children: [
            //       const Align(
            //         alignment: Alignment.centerRight,
            //         child: Text(
            //           "没有Key",
            //           style: TextStyle(
            //               fontSize: 20
            //           ),
            //         ),
            //       ),
            //       Row(
            //           children: boxListNoKey
            //       )
            //     ],
            //   ),
            // ),
            // Expanded(
            //   flex: 1,
            //   child:Stack(
            //     children: [
            //       const Align(
            //         alignment: Alignment.centerRight,
            //         child: Text(
            //           "有Key",
            //           style: TextStyle(
            //               fontSize: 20
            //           ),
            //         ),
            //       ),
            //       Row(
            //           children: boxListHasLocalKey
            //       )
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 1,
              child:Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "有LocalKey",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  MediaQuery.of(context).orientation == Orientation.portrait ? Row(
                      children: boxListHasLocalKey
                  ) : Column(
                    children: boxListHasLocalKey,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child:Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "有GlobalKey",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  MediaQuery.of(context).orientation == Orientation.portrait ? Row(
                      children: boxListHasGlobalKey
                  ) : Column(
                    children: boxListHasGlobalKey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BoxWidget extends StatefulWidget {
  final Color color;
  const BoxWidget({super.key,required this.color});

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),//ElevatedButton默认有内边距，建议取消内边距保证居中
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(widget.color)
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text(
            "$_count",
          style: const TextStyle(
            fontSize: 10
          ),
        ),
      ),
    );
  }
}




