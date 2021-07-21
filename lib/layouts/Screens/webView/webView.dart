import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layouts/Screens/Settings/settings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key key}) : super(key: key);
  static final routName = '/webview';

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context).settings.arguments as String;
    print('url ' + url);
    return Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl: url,
        ));
  }
}
