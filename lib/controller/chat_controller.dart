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
    String chatMessage = chatFieldController.text.trim();
    if (chatMessage.isEmpty) {
      print("Chat message is empty, returning.");
      return;
    }

    print("Sending message: $chatMessage");

    // Add the user's chat message to the chat list
    addChat(
      ChatModel(
        chatContent: chatMessage,
        isMyChat: true,
        chatTime: DateTime.now(),
        profilePicture: myProfilePicture,
        isChatAnimated: false,
      ),
    );

    chatFieldController.clear();

    // Initialize the generative model
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: 'AIzaSyC6IL9R9y_LaxkqUQd6eRBdLDgM9QbMcWA',
    );

    final content = [Content.text('$chatMessage')];

    try {
      // Generate a response from the model
      final response = await model.generateContent(content);
      print("Response received: ${response?.text}");

      // Check for null response or null text
      if (response != null && response.text != null) {
        addChat(
          ChatModel(
            chatContent: response.text!,
            isMyChat: false,
            chatTime: DateTime.now(),
            profilePicture: botProfilePicture,
            isChatAnimated: false,
          ),
        );
      } else {
        print("Error: Received null response or response text is null.");
      }
    } catch (error) {
      print("An error occurred during content generation: $error");
    }

    // Update the UI
    update();

    // Scroll to the latest chat message
    if (chatScrollController.hasClients) {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
