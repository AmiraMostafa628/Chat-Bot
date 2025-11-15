import 'package:chat_bot/features/chat/presentation/manager/chat_provider.dart';
import 'package:chat_bot/features/chat/presentation/view/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Chat Bot'),
        actions: [
          Consumer<ChatProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: provider.selectedMode,
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: Colors.blue,
                  icon: Icon(Icons.arrow_drop_down ,color: Colors.white,),
                  items: const [
                    DropdownMenuItem(
                      value: "gpt-4o-mini",
                      child: Text(
                        "GPT-4o Mini",

                      ),
                    ),
                    DropdownMenuItem(
                      value: "gpt-4.1-nano",
                      child: Text(
                        "GPT-4.1 nano",

                      ),
                    ),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      provider.changeMode(val);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: ChatViewBody(),
      ),
    );
  }
}
