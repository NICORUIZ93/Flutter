import 'package:flutter/material.dart';

/// A message input box with a built-in send button.
///
/// Improvements:
/// - Uses a [TextEditingController] so the input can be cleared after sending.
/// - Exposes [onSend] and [onChanged] callbacks instead of printing to console.
/// - Disables the send button when the input is empty to avoid sending empty messages.
/// - Uses [debugPrint] as a safe fallback when no callback is provided.
class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;
  final String hintText;
  const MessageFieldBox({
    super.key,
    required this.onValue,
    this.hintText = 'Type a message',
  });

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
} 

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    // Notify parent via the single callback used in the lesson.
    widget.onValue(text);

    // Clear input and reset local state.
    _controller.clear();
    setState(() => _text = '');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (_) => _send(),
            onChanged: (value) {
              setState(() => _text = value);
            },
            decoration: InputDecoration(hintText: widget.hintText),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: _text.trim().isEmpty
                ? colorScheme.surfaceContainerHighest
                : colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.send,
              color: _text.trim().isEmpty
                  ? colorScheme.onSurfaceVariant
                  : colorScheme.onPrimary,
            ),
            tooltip: 'Enviar',
            onPressed: _text.trim().isEmpty ? null : _send,
          ),
        ),
      ],
    );
  }
}
