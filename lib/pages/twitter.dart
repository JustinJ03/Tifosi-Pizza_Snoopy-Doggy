import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _twitterUrl = Uri.parse('https://x.com/pizzahutmsia');

Future<void> openTwitter(BuildContext context) async {
  try {
    if (await launchUrl(
      _twitterUrl,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    )) {
      return;
    }
  } catch (_) {
    // Show feedback if the platform cannot open the link.
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Could not open Twitter / X. Please try again.'),
    ),
  );
}

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    // Browsers and unsupported desktop platforms must not create a native WebView.
    if (kIsWeb ||
        !{
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
        }.contains(defaultTargetPlatform)) {
      return;
    }
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, Like Gecko) Chrome/120.0.0.0 Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (!request.url.startsWith('http://') &&
                !request.url.startsWith('https://')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(_twitterUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter / X', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: controller != null
          ? WebViewWidget(controller: controller!)
          : Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => openTwitter(context),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open Twitter / X'),
              ),
            ),
    );
  }
}

typedef Twitter = TwitterPage;
