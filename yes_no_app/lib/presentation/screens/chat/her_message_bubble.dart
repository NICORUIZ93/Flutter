import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// Simplified bubble that supports text and an optional image (remote or asset).
class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  bool get _hasImage => (message.imageUrl ?? '').isNotEmpty;
  bool _isNetwork(String url) => url.startsWith('http');

  void _openImage(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: InteractiveViewer(
          child: _isNetwork(url)
              ? Image.network(url, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image))
              : Image.asset(url, fit: BoxFit.contain),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final content = <Widget>[];

    if (_hasImage) {
      final url = message.imageUrl!;
      final image = _isNetwork(url)
          ? Image.network(url, height: 160, width: double.infinity, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => SizedBox(height: 160, child: Center(child: Icon(Icons.broken_image, color: cs.onSecondaryContainer))))
          : Image.asset(url, height: 160, width: double.infinity, fit: BoxFit.cover);

      content.add(
        GestureDetector(
          onTap: () => _openImage(context, url),
          child: ClipRRect(borderRadius: BorderRadius.circular(12), child: image),
        ),
      );

      if (message.text.isNotEmpty) content.add(const SizedBox(height: 8));
    }

    if (message.text.isNotEmpty) {
      content.add(Text(message.text, style: TextStyle(color: cs.onSecondaryContainer)));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8, right: 60, top: 8),
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
          decoration: BoxDecoration(color: cs.secondaryContainer, borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomRight: Radius.circular(16), bottomLeft: Radius.circular(4))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: content),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 6.0),
          child: Text('${message.timestamp.hour.toString().padLeft(2, '0')}:${message.timestamp.minute.toString().padLeft(2, '0')}', style: Theme.of(context).textTheme.bodySmall),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
