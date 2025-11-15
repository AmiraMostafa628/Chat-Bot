import 'package:chat_bot/core/models/chat_model.dart';
import 'package:chat_bot/features/chat/presentation/view/type_indicator_widget.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.type == MessageType.user
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 300,
          ),

          padding: const EdgeInsets.all(15.0),
          decoration:  BoxDecoration(
              color: message.type == MessageType.user
                  ? Colors.blue[200]
                  : Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomStart:  message.type == MessageType.user ? Radius.circular(10.0): Radius.zero,
                bottomEnd:  message.type == MessageType.model ? Radius.circular(10.0): Radius.zero,

              )
          ),
          child: message.isTyping?TypingIndicator():
              Text(message.content),
        ),
      ),
    );
  }
}