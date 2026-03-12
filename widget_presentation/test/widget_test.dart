// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_presentation/main.dart';

void main() {
  testWidgets('Inbox displays emails and allows dismissal', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EmailApp());

    // Verify that the inbox title is displayed.
    expect(find.text('Inbox'), findsOneWidget);

    // Verify that the first email is displayed.
    expect(find.text('Welcome to Flutter'), findsOneWidget);

    // Dismiss the first email by swiping left.
    await tester.drag(find.text('Welcome to Flutter'), const Offset(-500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify that the email is no longer displayed.
    expect(find.text('Welcome to Flutter'), findsNothing);

    // Verify that another email is still displayed.
    expect(find.text('Your package has shipped'), findsOneWidget);
  });
}
