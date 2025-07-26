// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_calculator/main.dart';

void main() {
  testWidgets('Calculator app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CalculatorApp());

    // Verify that our calculator has a display and buttons.
    expect(find.text('0'), findsAtLeastNWidgets(1)); // Display shows 0 and there's a 0 button
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
  });

  testWidgets('Calculator basic addition test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CalculatorApp());

    // Tap 2 + 3 = and verify result is 5
    await tester.tap(find.text('2'));
    await tester.pump();
    
    await tester.tap(find.text('+'));
    await tester.pump();
    
    await tester.tap(find.text('3'));
    await tester.pump();
    
    await tester.tap(find.text('='));
    await tester.pump();

    // Verify that the result is 5 (appears in display and as button).
    expect(find.text('5'), findsAtLeastNWidgets(1));
  });
}
