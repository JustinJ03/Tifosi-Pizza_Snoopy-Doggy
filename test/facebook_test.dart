import 'package:doggy/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  for (final route in ['2']) {
    testWidgets(
      'Facebook route $route works without a native WebView',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        tester.state<NavigatorState>(find.byType(Navigator)).pushNamed(route);
        await tester.pumpAndSettle();

        expect(
          find.widgetWithText(ElevatedButton, 'Open Facebook'),
          findsOneWidget,
        );
        expect(find.byType(WebViewWidget), findsNothing);
        expect(tester.takeException(), isNull);
      },
      variant: TargetPlatformVariant({
        // Also cover a mobile browser: kIsWeb must take priority over Android.
        kIsWeb ? TargetPlatform.android : TargetPlatform.windows,
      }),
    );
  }
}
