import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    expect(find.text('Explore'), findsOneWidget);
  });
}
