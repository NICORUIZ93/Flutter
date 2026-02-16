import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('MyApp shows app bar and greeting', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}
