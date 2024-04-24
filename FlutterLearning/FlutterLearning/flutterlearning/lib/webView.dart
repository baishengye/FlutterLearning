import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewApp extends StatelessWidget {
  const WebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WebView"),
        ),
        body: const WebViewPage(),
      ),
    );
  }
}
class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {


  bool _hasLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          !_hasLoading?const LinearProgressIndicator():const Text("加载完成"),
          Expanded(child: InAppWebView(
            initialUrlRequest:URLRequest(
                url: Uri.parse("https://fanyi.baidu.com/mtpe-individual/multimodal?aldtype=16047&query=&keyfrom=baidu&smartresult=dict&lang=auto2zh#/auto/zh/")
            ),
            onProgressChanged: (controller, progress){
              print(progress/100);
              if(progress>=100){
                setState(() {
                  _hasLoading = true;
                });
              }
            },
          ))
        ],
      ),
    );
  }
}
