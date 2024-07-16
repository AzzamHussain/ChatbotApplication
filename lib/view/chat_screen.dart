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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Your Bot',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
          backgroundColor: Color.fromARGB(255, 22, 201, 126),
          
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
          }
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            color: Colors.white,
            child: TextFormField(
              
              controller: cont.chatFieldController,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              decoration: InputDecoration(
                hintText: "Enter Message Here...",
                
                suffixIcon: InkWell(
                  onTap: () {
                    cont.postChatMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
      borderSide: BorderSide(color: Colors.blue, width: 2.0), // Customize the border side if needed
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0), // Adjust the radius here
      borderSide: BorderSide(color: Colors.grey, width: 1.0), // Customize the border side if needed
    ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
