import 'package:flutter_test/flutter_test.dart';
import 'package:stylish/models/Category.dart';

void main() {
  group('Category', () {
    test('should assign icon and title correctly from constructor', () {
      final category = Category(
        icon: 'assets/icons/test_icon.svg',
        title: 'Test Category',
      );

      expect(category.icon, 'assets/icons/test_icon.svg');
      expect(category.title, 'Test Category');
    });

    test('should have demo_categories populated', () {
      expect(demo_categories, isNotEmpty);
      expect(demo_categories.length, 4);

      expect(demo_categories[0].title, 'Dress');
      expect(demo_categories[0].icon, 'assets/icons/dress.svg');
    });
  });
}
