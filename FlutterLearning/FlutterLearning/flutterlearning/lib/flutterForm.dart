import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FlutterFormApp extends StatelessWidget {
  const FlutterFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("表单"),
        ),
        body: ListView(
          children: const [
            TextFieldPage(),
            SizedBox(height: 20),
            RadioPage(),
            SizedBox(height: 20),
            CheckBoxPage()
          ],
        ),
      ),
    );
  }
}

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  String username = "章北海";

  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController.fromValue(TextEditingValue(
        text: username,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: username.length))));
    //
    // _textEditingController.addListener(() {
    //   log(_textEditingController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          TextField(
            obscureText: false,
            onChanged: (value) {
              setState(() {
                username = value;
              });
              log("onChanged:$value");
            },
            onEditingComplete: () {
              log("onEditingComplete:${_textEditingController.text}");
            },
            onSubmitted: (value) {
              log("onSubmitted:$value");
            },
            onTapOutside: (event) {
              log("onTapOutside:${event.toString()}");
            },
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                suffixIcon: Icon(Icons.close),
                suffixText: "tcp://",
                prefixIcon: Icon(Icons.person),
                prefixText: "http://",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0))),
            maxLines: 1,
            maxLength: 20,
            controller: _textEditingController,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text(username),
          )
        ],
      ),
    );
  }
}

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int sex = 1;
  int flag = 1;

  _onChanged(value) {
    setState(() {
      sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.purpleAccent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("男:"),
              Radio(
                  value: 1,
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value as int;
                    });
                  }),
              const SizedBox(width: 20),
              const Text("女:"),
              Radio(value: 2, groupValue: sex, onChanged: _onChanged),
              const SizedBox(width: 40),
              Text(sex == 1 ? "男" : "女")
            ],
          ),
          const SizedBox(height: 20),
          Text("是否已进行核酸检测"),
          Row(
            children: [
              SizedBox(
                width: 175,
                child: RadioListTile(
                    title: const Text(
                      "已完成核酸",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: 1,
                    groupValue: flag,
                    onChanged: (value) {
                      setState(() {
                        flag = value as int;
                      });
                    }),
              ),
              SizedBox(
                width: 175,
                child: RadioListTile(
                    title: const Text(
                      "未完成核酸",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: 2,
                    groupValue: flag,
                    onChanged: (value) {
                      setState(() {
                        flag = value as int;
                      });
                    }),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(flag == 1 ? "已完成" : "未完成")],
          ),
        ],
      ),
    );
  }
}

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  List list = [
    {"title": "多选框1", "value": false},
    {"title": "多选框2", "value": false},
    {"title": "开关3", "value": false},
    {"title": "开关4", "value": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              list[0]["title"],
            ),
            const SizedBox(width: 20),
            Checkbox(
              value: list[0]["value"],
              onChanged: (value) {
                setState(() {
                  list[0]["value"] = value;
                });
              },
              activeColor: Colors.red,//填充颜色
              checkColor: Colors.white,//对勾颜色
              materialTapTargetSize: MaterialTapTargetSize.padded,
              tristate: true,//true:则被选中后无法取消
              focusColor: Colors.blue,//获取焦点的颜色
              hoverColor: Colors.green,
            )
          ]),
          CheckboxListTile(
            value: list[1]["value"],
            onChanged: (value) {
              setState(() {
                list[1]["value"] = value;
              });
            },
            title: Text(list[1]["title"]),
            subtitle: Text("${list[1]["title"]}-副标题"),
            secondary: const Icon(Icons.add),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.red,
            checkColor: Colors.white,
            selected: true,
            contentPadding: EdgeInsets.all(10),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              list[2]["title"],
            ),
            const SizedBox(width: 20),
            Switch(
              value: list[2]["value"],
              onChanged: (value) {
                setState(() {
                  list[2]["value"] = value;
                });
              },
              activeColor: Colors.red,
              activeTrackColor: Colors.blue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              dragStartBehavior: DragStartBehavior.down,
            )
          ]),
          SwitchListTile(
            value: list[3]["value"],
            onChanged: (value) {
              setState(() {
                list[3]["value"] = value;
              });
            },
            title: Text(list[3]["title"]),
            subtitle: Text("${list[3]["title"]}-副标题"),
            secondary: const Icon(Icons.pages),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.red,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
          )
        ],
      ),
    );
  }
}
