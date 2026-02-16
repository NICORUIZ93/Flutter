import 'package:flutter_test/flutter_test.dart';
import 'package:wingets_app/menu/menu_items.dart';

void main() {
  test('no hay rutas duplicadas en appMenuItems', () {
    final links = appMenuItems.map((item) => item.link).toList();
    expect(links.toSet().length, links.length);
  });

  test('todas las rutas del menu se resuelven en routeToMenuItem', () {
    for (final item in appMenuItems) {
      expect(menuItemByRoute(item.link), isNotNull);
    }
  });
}
