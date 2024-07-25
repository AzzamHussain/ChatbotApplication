import 'package:chatbotapp/components/chat_bubble.dart';
import 'package:chatbotapp/controller/chat_controller.dart';
import 'package:chatbotapp/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ThemeController instance
    final ThemeController themeController = Get.find<ThemeController>();

    return GetBuilder<ChatController>(builder: (cont) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Your Bot',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white, // Set icon color for settings
                  ),
                  onPressed: () {
                    _showSettingsDialog(context, themeController);
                  },
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
          },
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: TextFormField(
              controller: cont.chatFieldController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color, // Theme text color
              ),
              decoration: InputDecoration(
                hintText: "Write your message...",
                hintStyle: TextStyle(
                  color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    cont.postChatMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // Function to show a settings dialog
  void _showSettingsDialog(BuildContext context, ThemeController themeController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                    Navigator.of(context).pop(); // Close the dialog after switching
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
