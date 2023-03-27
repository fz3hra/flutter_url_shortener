import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    var pastedText;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (args != null) {
      pastedText = args["pastedText"];
    }
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller
              ..setNavigationDelegate(
                NavigationDelegate(
                    onPageStarted: (url) => setState(() {
                          loadingPercentage = 0;
                        }),
                    onProgress: (progress) {
                      setState(() {
                        loadingPercentage = progress;
                      });
                    },
                    onPageFinished: (url) {
                      setState(() {
                        loadingPercentage = 100;
                      });
                    }),
              )
              ..loadRequest(
                Uri.parse(pastedText),
              ),
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
