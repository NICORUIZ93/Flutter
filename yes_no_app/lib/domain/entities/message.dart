import 'dart:convert';

enum FromWho { me, her }

class Message {
  final String text;
  final DateTime timestamp;
  final String? imageUrl;
  final FromWho fromWho;
  Message({
    required this.text,
    required this.timestamp,
    this.imageUrl,
    required this.fromWho,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'timestamp': timestamp.toIso8601String(),
        'imageUrl': imageUrl,
        'fromWho': fromWho == FromWho.me ? 'me' : 'her',
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json['text'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        imageUrl: json['imageUrl'] as String?,
        fromWho: (json['fromWho'] as String) == 'me' ? FromWho.me : FromWho.her,
      );

  @override
  String toString() => jsonEncode(toJson());
} 
