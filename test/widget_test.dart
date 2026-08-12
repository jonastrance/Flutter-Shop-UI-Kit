import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stylish/main.dart';
import 'package:stylish/screens/home/home_screen.dart';

void main() {
  testWidgets('MyApp builds correctly and renders HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that MaterialApp is rendered.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
