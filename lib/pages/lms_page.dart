import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LmsPage extends StatefulWidget {
  const LmsPage({super.key});

  @override
  State<LmsPage> createState() => _LmsPageState();
}

class _LmsPageState extends State<LmsPage> {
  //intialize webview controller

  //disabled js restrictions that are put by WebView widget so as to display lms page properly
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://lms-kjsce.somaiya.edu/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KJSCE L M S'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
