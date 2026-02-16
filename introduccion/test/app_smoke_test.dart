import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/main.dart';

void main() {
  testWidgets('MyApp renders counter screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Contador'), findsWidgets);
    expect(find.text('0'), findsOneWidget);
  });
}
