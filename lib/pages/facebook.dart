import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _facebookUrl = Uri.parse('https://www.facebook.com/pizzawowoficial/');

Future<void> openFacebook(BuildContext context) async {
  // Launch from the click handler so browsers allow the new tab.
  try {
    if (await launchUrl(
      _facebookUrl,
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
    const SnackBar(content: Text('Could not open Facebook. Please try again.')),
  );
}

class FacebookPage extends StatefulWidget {
  const FacebookPage({super.key});

  @override
  State<FacebookPage> createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
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
      ..loadRequest(_facebookUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: controller != null
          ? WebViewWidget(controller: controller!)
          : Center(
              child: ElevatedButton.icon(
                onPressed: () => openFacebook(context),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open Facebook'),
              ),
            ),
    );
  }
}
