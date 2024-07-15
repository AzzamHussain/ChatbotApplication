import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: "Azzam", lastName: "Hussain");
  final ChatUser _GptChatUser =
      ChatUser(id: '2', firstName: "Chat", lastName: "Gpt");
  List<ChatMessage> _message = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 166, 126, 1),
        title: const Text(
          "Your Bot",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DashChat(
          currentUser: _currentUser,
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _message),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {}
}
