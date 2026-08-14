import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/screens/home/home_screen.dart';
import 'package:stylish/screens/home/components/search_form.dart';
import 'package:stylish/screens/home/components/categories.dart';
import 'package:stylish/screens/home/components/new_arrival_products.dart';
import 'package:stylish/screens/home/components/popular_products.dart';

void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('best Outfits for you'), findsOneWidget);
    expect(find.byType(SearchForm), findsOneWidget);
    expect(find.byType(Categories), findsOneWidget);
    expect(find.byType(NewArrivalProducts), findsOneWidget);
    expect(find.byType(PopularProducts), findsOneWidget);
  });
}
