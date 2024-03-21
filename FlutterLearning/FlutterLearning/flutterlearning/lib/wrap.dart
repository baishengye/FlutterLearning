
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapApp extends StatelessWidget{
  const WrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Wrap"),
        ),
        body: ListView(
          children: [
            const Text("头部"),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              runAlignment: WrapAlignment.spaceAround,
              spacing: 20,
              runSpacing: 20,
              children: [
                Button("1", onPressed: (){}),
                Button("12", onPressed: (){}),
                Button("123", onPressed: (){}),
                Button("1234", onPressed: (){}),
                Button("12345", onPressed: (){}),
                Button("123456", onPressed: (){}),
                Button("1234567", onPressed: (){}),
                Button("12345678", onPressed: (){}),
                Button("123456789", onPressed: (){}),
                Button("1111111111", onPressed: (){}),
                Button("11111111111", onPressed: (){}),
                Button("111111111111", onPressed: (){}),
                Button("1111111111111", onPressed: (){})
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget{
  final String text;
  final void Function()? onPressed;

  const Button(this.text,{Key? key,required this.onPressed}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

}