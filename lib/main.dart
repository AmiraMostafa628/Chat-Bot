import 'package:chat_bot/features/chat/presentation/manager/chat_provider.dart';
import 'package:chat_bot/features/chat/presentation/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ChatProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatView(),
      ),
    );
  }
}

