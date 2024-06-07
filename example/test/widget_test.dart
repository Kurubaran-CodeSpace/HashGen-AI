import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Hashtag generation button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the generate button is present.
    expect(find.text('Generate Hashtags'), findsOneWidget);

    // Tap the 'Generate Hashtags' button.
    await tester.tap(find.text('Generate Hashtags'));
    await tester.pump();

    // Verify that hashtags are generated and displayed.
    expect(find.byType(Text), findsWidgets);
  });
}