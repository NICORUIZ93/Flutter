import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingets_app/main.dart';

void main() {
  testWidgets('MyApp renderiza la pantalla principal', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    expect(find.text('Flutter + Material 3'), findsOneWidget);
    expect(find.text('Botones'), findsOneWidget);
  });
}
