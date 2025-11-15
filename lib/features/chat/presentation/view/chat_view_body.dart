import 'package:chat_bot/features/chat/presentation/manager/chat_provider.dart';
import 'package:chat_bot/features/chat/presentation/view/user_message_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatViewBody extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<ChatProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.messages.length,
                itemBuilder: (context, index) {
                  final msg = provider.messages[index];

                  return MessageView(message: msg);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        final text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          Provider.of<ChatProvider>(
                            context,
                            listen: false,
                          ).sendTextMessage(text);
                          _controller.clear();
                        }
                      },
                    ),
                    //
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.add, color: Colors.white),
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(10, 10),
                          maximumSize: const Size(10, 10),
                          iconSize: 17,

                        ),

                        onSelected: (value) {
                          if (value == "new") {
                            Provider.of<ChatProvider>(
                              context,
                              listen: false,
                            ).toggleChat(true);
                          }
                        },
                        itemBuilder: (ctx) => [
                          const PopupMenuItem(
                            value: "new",
                            child: Text("New Chat"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
