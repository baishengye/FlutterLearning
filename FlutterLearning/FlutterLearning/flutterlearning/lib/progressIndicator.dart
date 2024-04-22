import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Indicator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Progress Indicator'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          semanticChildCount: 3,
          children: const [
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: CupertinoActivityIndicator(
                radius: 20,
                animating: true,
                color: Colors.lightGreen,
              ),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 10,
              semanticsLabel: 'Linear progress indicator',
              semanticsValue: '50%',
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(200, 0, 200, 0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: 10,
                strokeAlign: CircularProgressIndicator.strokeAlignOutside,
                strokeCap: StrokeCap.round,
                semanticsLabel: 'Circular progress indicator',
                semanticsValue: '50%',
              ),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
