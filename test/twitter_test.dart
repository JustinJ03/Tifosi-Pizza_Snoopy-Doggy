import 'package:doggy/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  for (final route in ['3']) {
    testWidgets(
      'Twitter route $route works without a native WebView',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        tester.state<NavigatorState>(find.byType(Navigator)).pushNamed(route);
        await tester.pumpAndSettle();

        // 1. Check for text regardless of button type (replace 'Open Twitter' if your text is different)
        expect(find.text('Open Twitter / X'), findsOneWidget);

        // 2. Ensure native WebView is not used in non-supported environments
        expect(find.byType(WebViewWidget), findsNothing);
        expect(tester.takeException(), isNull);
      },
      variant: TargetPlatformVariant({
        kIsWeb ? TargetPlatform.android : TargetPlatform.windows,
      }),
    );
  }
}
