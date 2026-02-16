import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingets_app/presentation/providers/theme_provider.dart';

void main() {
  test('theme providers tienen estado inicial esperado', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(isDarkModeProvider), false);
    expect(container.read(selectedColorProvider), 4);
  });

  test('theme providers permiten actualizar estado', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(isDarkModeProvider.notifier).state = true;
    container.read(selectedColorProvider.notifier).state = 2;

    expect(container.read(isDarkModeProvider), true);
    expect(container.read(selectedColorProvider), 2);
  });
}
