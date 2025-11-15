enum MessageType { user, model }

class ChatMessage {
  final String content;
  final MessageType type;
  final bool isTyping;

  ChatMessage({
    required this.content,
    required this.type,
    this.isTyping = false,
  });
}
