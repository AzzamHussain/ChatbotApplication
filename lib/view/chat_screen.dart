import 'package:chatbotapp/components/chat_bubble.dart';
import 'package:chatbotapp/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (cont) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Your Bot',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 37, 177, 135),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0), // Add padding if needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust radius for circular shape
                  child: Image.asset(
                    'assets/profile.png', // Replace with your image URL or AssetImage
                    width: 35.0, // Adjust size as needed
                    height: 35.0, // Adjust size as needed
                    fit: BoxFit
                        .cover, // Ensures the image covers the circular area
                  ),
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: ListView.builder(
            controller: cont.chatScrollController,
            itemCount: cont.chats.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                isMyChat: cont.chats[index].isMyChat,
                chatData: cont.chats[index],
              );
            }),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            color: Colors.white,
            child: TextFormField(
              controller: cont.chatFieldController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "Enter Message Here...",
                suffixIcon: InkWell(
                  onTap: () {
                    cont.postChatMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 37, 177, 135),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Adjust the radius here
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Adjust the radius here
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 37, 177, 135),
                      width: 2.0), // Customize the border side if needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Adjust the radius here
                  borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0), // Customize the border side if needed
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
