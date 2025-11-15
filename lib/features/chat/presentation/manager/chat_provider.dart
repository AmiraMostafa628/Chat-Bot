import 'package:chat_bot/core/models/chat_model.dart';
import 'package:chat_bot/core/services/text_model_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ChatProvider extends ChangeNotifier {
  final TextModelClient _textClient = TextModelClient();

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  String selectedMode = "gpt-4o-mini";

  void changeMode(String mode) {
    selectedMode = mode;
    notifyListeners();
  }

  bool isNewChat = true;
  void toggleChat(bool newChat) {
    isNewChat = newChat;
    if (newChat) {
      _messages.clear();
    }
    notifyListeners();
  }

  Future<void> sendTextMessage(String message) async {
    if (isNewChat) {
      _messages.clear();
      isNewChat = false;
    }

    _messages.add(ChatMessage(content: message, type: MessageType.user));
    notifyListeners();

    final typingMsg = ChatMessage(
      content: "typing...",
      type: MessageType.model,
      isTyping: true,
    );
    _messages.add(typingMsg);
    notifyListeners();

    try {
      final reply = await _textClient.sendMessage(message, model: selectedMode);

      _messages.remove(typingMsg);
      _messages.add(ChatMessage(content: reply, type: MessageType.model));
    } catch (e) {
      print(e.toString());
      _messages.remove(typingMsg);
      _messages.add(ChatMessage(content: "Error: $e", type: MessageType.model));
    }

    notifyListeners();
  }
}
