// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_app/main.dart';

void main() {
  testWidgets('RollDice displays correct initial value', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RollDice());

    // Verify that our dice shows the initial value.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsNothing);

    // Tap the roll button and trigger a frame.
    await tester.tap(fin  d.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that our dice has rolled.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
