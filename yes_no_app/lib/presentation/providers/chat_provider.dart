import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(
      text: 'Hola amor',
      timestamp: DateTime.now(),
      fromWho: FromWho.me,
      imageUrl:
          'https://media2.giphy.com/media/v1.Y2lkPWFmMzk1ZjIwMW05MGNseDBxYmY0emxvaWpremwxeHk2MGphc213NmZnb3ZteWlncSZlcD12MV9naWZzX3JhbmRvbSZjdD1n/GOWomaa3rwfMIT6nyl/giphy.gif',
    ),
    Message(
      text: 'Hola cariño, ¿cómo estás?',
      timestamp: DateTime.now(),
      fromWho: FromWho.her,
    ),
    Message(
      text: '¿Quieres salir a cenar esta noche?',
      timestamp: DateTime.now(),
      fromWho: FromWho.me,
    ),
    Message(
      text: '¡Claro! ¿A dónde te gustaría ir?',
      timestamp: DateTime.now(),
      fromWho: FromWho.her,
    ),
  ];

  ChatProvider({bool loadFromStorage = true}) {
    if (loadFromStorage) _loadMessages();
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('messages');
    if (jsonString == null) {
      await _saveMessages(); // persist defaults
      return;
    }

    try {
      final List decoded = jsonDecode(jsonString) as List;
      messagesList = decoded
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (_) {
      // If parsing fails, keep defaults and overwrite saved value
      await _saveMessages();
    }
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(messagesList.map((e) => e.toJson()).toList());
    await prefs.setString('messages', jsonString);
  }

  Future<void> sendMessage(String text) async {
    final newMessage = Message(
      text: text,
      timestamp: DateTime.now(),
      fromWho: FromWho.me,
    );
    messagesList.add(newMessage);
    await _saveMessages();
    herReply();
    notifyListeners();
  }

  Future<void> herReply() async {
    final answer = await getYesNoAnswer.getAnswer();
    messagesList.add(answer);
    await _saveMessages();
    notifyListeners();
  }
}
