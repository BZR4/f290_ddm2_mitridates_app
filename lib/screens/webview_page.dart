// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ExtrasWebView extends StatefulWidget {
//   const ExtrasWebView({this.url});

//   @override
//   _ExtrasWebViewState createState() => _ExtrasWebViewState();

//   final String url;
// }

// class _ExtrasWebViewState extends State<ExtrasWebView> {
//   final _controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//       initialUrl: 'https://google.com',
//       javascriptMode: JavascriptMode.unrestricted,
//       javascriptChannels:
//           <JavascriptChannel>[_javascriptChannel(context)].toSet(),
//       onWebViewCreated: (WebViewController webViewController) {
//         _controller.complete(webViewController);
//       },
//     );
//   }

//   JavascriptChannel _javascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: 'Messenger',
//         onMessageReceived: (JavascriptMessage message) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         });
//   }
// }
