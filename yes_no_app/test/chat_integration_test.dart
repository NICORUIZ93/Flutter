import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class _FakeYesNoAnswer extends GetYesNoAnswer {
  @override
  Future<Message> getAnswer() async {
    return Message(
      text: 'Respuesta de prueba',
      timestamp: DateTime.now(),
      fromWho: FromWho.her,
    );
  }
}

void main() {
  testWidgets('send message via MessageFieldBox updates provider and UI', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    final chatProvider = ChatProvider(
      loadFromStorage: false,
      yesNoAnswer: _FakeYesNoAnswer(),
    );
    chatProvider.messagesList.clear();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: chatProvider,
        child: const MaterialApp(home: ChatScreen()),
      ),
    );

    final field = find.byType(TextFormField);
    expect(field, findsOneWidget);

    await tester.enterText(field, 'Hola desde test');
    await tester.pump();

    final sendIcon = find.byIcon(Icons.send);
    expect(sendIcon, findsOneWidget);

    await tester.tap(sendIcon);
    await tester.pumpAndSettle();

    expect(chatProvider.messagesList.any((m) => m.text.contains('Hola desde test')), isTrue);
    expect(chatProvider.messagesList.any((m) => m.text == 'Respuesta de prueba'), isTrue);

    expect(find.textContaining('Hola desde test'), findsWidgets);
  });
}
