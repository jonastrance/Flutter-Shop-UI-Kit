import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stylish/main.dart';
import 'package:stylish/screens/home/home_screen.dart';
import 'package:stylish/screens/home/components/search_form.dart';
import 'package:stylish/screens/home/components/categories.dart';

void main() {
  testWidgets('App loads and shows HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is rendered
    expect(find.byType(HomeScreen), findsOneWidget);

    // Verify that the Explore text is rendered
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('best Outfits for you'), findsOneWidget);

    // Verify search form is rendered
    expect(find.byType(SearchForm), findsOneWidget);

    // Verify categories are rendered
    expect(find.byType(Categories), findsOneWidget);
  });
}
