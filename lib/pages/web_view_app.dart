import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parking/shared/drawer_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload file"),
      ),
      drawer: DrawerNavigation(),
      body: WebView(
        initialUrl: 'https://vecinoo.herokuapp.com/v1/api/file',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webController) {
          _controller.complete(webController);
        },
      ),
    );
  }
}
