import 'package:chatbotapp/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatController extends GetxController {
  List<ChatModel> chats = [];
  TextEditingController chatFieldController = TextEditingController();

  ScrollController chatScrollController = ScrollController();

  int? value;

  final String myProfilePicture = 'assets/profile.png'; // Add this
  final String botProfilePicture = 'assets/195.png'; // Add this

  addChat(ChatModel chatData) {
    chats.add(chatData);
    update();
  }

  postChatMessage() async {
    String chatMessage = chatFieldController.text;
    chats.add(ChatModel(
        chatContent: chatMessage,
        isMyChat: true,
        chatTime: DateTime.now(),
        profilePicture: myProfilePicture,
        isChatAnimated: false)); // Add profilePicture here
    update();
    chatFieldController.clear();
    final model = GenerativeModel(
       //api with apikey comes here
        model: 'gemini-1.5-flash',
        apiKey: 
       );
    final content = [Content.text('${chatMessage}')];
    final response = await model.generateContent(content);
    if (response != null) {
      chats.add(ChatModel(
          chatContent: response.text!,
          isMyChat: false,
          chatTime: DateTime.now(),
          profilePicture: botProfilePicture,
          isChatAnimated: false)); // Add profilePicture here
      update();
    }
  }
}
