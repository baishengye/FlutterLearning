import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceAndConnectivityApp extends StatelessWidget {
  const DeviceAndConnectivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("设备信息的网络状态"),
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              height: 200,
              child: DevicePage(),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.redAccent,
              height: 200,
              child: NetworkPage(),
            )
          ],
        ),
      ),
    );
  }
}

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});
  @override
  State<DevicePage> createState() => _DevicePageState();
}
class _DevicePageState extends State<DevicePage> {
  late List<Widget> _list = [];
  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }
  _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final deviceInfoMap = deviceInfo.toMap();
    var templist = deviceInfoMap.entries.map((e) {
      return ListTile(
        title: Text("${e.key}:${e.value}"),
      );
    }).toList();
    setState(() {
      _list=templist;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _list,
    );
  }
}

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});
  @override
  State<NetworkPage> createState() => _NetworkPageState();
}
class _NetworkPageState extends State<NetworkPage> {
  dynamic subscription;
  String _stateText = "检测中...";
  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        setState(() {
          _stateText = "处于 wifi";
        });
      } else if (result == ConnectivityResult.mobile) {
        setState(() {
          _stateText = "处于手机网络";
        });
      } else {
        setState(() {
          _stateText = "没有网络";
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_stateText),
    );
  }
}
