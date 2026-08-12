import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/details/details_screen.dart';
import 'package:stylish/screens/details/components/color_dot.dart';

void main() {
  testWidgets('DetailsScreen renders correctly', (WidgetTester tester) async {
    // Increase surface size to avoid RenderFlex overflow during test
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    final product = Product(
      image: "assets/images/product_0.png",
      title: "Test Shirt",
      price: 99,
      bgColor: Colors.white,
    );

    await tester.pumpWidget(MaterialApp(
      home: DetailsScreen(product: product),
    ));

    // Verify Title and Price
    expect(find.text('Test Shirt'), findsOneWidget);
    expect(find.text('\$99'), findsOneWidget);

    // Verify Description Text
    expect(find.textContaining('A Henley shirt is a collarless pullover shirt'), findsOneWidget);

    // Verify Add to Cart button
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify Colors section
    expect(find.text('Colors'), findsOneWidget);
    expect(find.byType(ColorDot), findsNWidgets(3));

    // reset size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
