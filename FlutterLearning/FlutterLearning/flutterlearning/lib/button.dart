
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget{
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Button"),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white24),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    shadowColor: MaterialStateProperty.all(Colors.orange),
                    elevation: MaterialStateProperty.all(20),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    side: MaterialStateProperty.all(
                        const BorderSide(
                            width: 3,
                            color: Colors.black
                        )
                    ),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    )
                ),
                child: const Text("ElevatedButton ButtonStyle"),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("ElevatedButton")
              )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: TextButton(
                    onPressed: () {},
                    child: const Text("TextButton")
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("OutlinedButton")
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up)
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text("ElevatedButton.icon"),
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("ElevatedButton.icon"),
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("OutlinedButton.icon"),
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("TextButton.icon"),
                )
            ),
            Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    label: const Text("使用SizeBox修改Button的大小"),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}