import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/screens/home/components/product_card.dart';
import 'package:stylish/constants.dart';

void main() {
  group('ProductCard Widget Tests', () {
    testWidgets('renders ProductCard with correct image, title, and price', (WidgetTester tester) async {
      // Define test data
      const String testImage = 'assets/images/product_0.png';
      const String testTitle = 'Long Sleeve Shirts';
      const int testPrice = 165;
      const Color testBgColor = Color(0xFFEFEFF2);
      bool isPressed = false;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              image: testImage,
              title: testTitle,
              price: testPrice,
              bgColor: testBgColor,
              press: () {
                isPressed = true;
              },
            ),
          ),
        ),
      );

      // Verify Title
      expect(find.text(testTitle), findsOneWidget);

      // Verify Price
      expect(find.text("\$$testPrice"), findsOneWidget);

      // Verify Image
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
      final Image imageWidget = tester.widget(imageFinder);
      expect((imageWidget.image as AssetImage).assetName, testImage);

      // Verify Background Color
      final containerFinder = find.byWidgetPredicate(
        (widget) => widget is Container &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color == testBgColor,
      );
      expect(containerFinder, findsOneWidget);

      // Verify press callback
      expect(isPressed, isFalse);
      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();
      expect(isPressed, isTrue);
    });
  });
}
