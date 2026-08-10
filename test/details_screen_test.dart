import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/details/details_screen.dart';

void main() {
  testWidgets('DetailsScreen renders product details and Add to Cart button', (WidgetTester tester) async {
    // 1. Create a mock Product
    final product = Product(
      image: 'assets/images/product_0.png',
      title: 'Test Product',
      price: 99,
      bgColor: Colors.blue,
    );

    // 2. Set screen size large enough to avoid overflow during test
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    // 3. Build the DetailsScreen wrapped in a MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: DetailsScreen(product: product),
      ),
    );

    // Reset view sizing
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // 3. Verify the rendering of product details
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('\$99'), findsOneWidget);

    // 4. Verify rendering of static strings
    expect(find.text('Colors'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);

    // 5. Verify image is present
    expect(find.byType(Image), findsOneWidget);

    // 6. Verify back button and heart icon are present
    expect(find.byType(BackButton), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing); // It uses SvgPicture.asset("assets/icons/Heart.svg"), so Icons.favorite is not found.
  });
}
