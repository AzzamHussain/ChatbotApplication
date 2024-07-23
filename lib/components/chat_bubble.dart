import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbotapp/controller/chat_controller.dart';
import 'package:chatbotapp/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, this.isMyChat = false, required this.chatData});
  bool isMyChat;
  ChatModel chatData;

  ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(chatData.chatTime);

    return Column(
      crossAxisAlignment:
          isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isMyChat ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isMyChat)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    chatData.profilePicture,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
                minWidth: MediaQuery.of(context).size.width * 0.2,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: isMyChat == false
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topRight: isMyChat
                          ? const Radius.circular(0)
                          : const Radius.circular(10),
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10)),
                  color: isMyChat
                      ? Color.fromARGB(255, 37, 177, 135)
                      : Color.fromARGB(255, 37, 177, 135)),
              child: isMyChat == true
                  ? Text(
                      chatData.chatContent,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  : chatData.isChatAnimated == true
                      ? Text(
                          chatData.chatContent,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          onFinished: () {
                            chatData.isChatAnimated = false;
                            _chatController.chatScrollController.animateTo(
                              _chatController.chatScrollController.position
                                  .maxScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            );
                          },
                          animatedTexts: [
                              TypewriterAnimatedText(
                                chatData.chatContent,
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                speed: const Duration(milliseconds: 50),
                              ),
                            ]),
            ),
            if (isMyChat)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    chatData.profilePicture,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            formattedTime,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
