import 'package:chatbotapp/components/chat_bubble.dart';
import 'package:chatbotapp/controller/chat_controller.dart';
import 'package:chatbotapp/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

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
              Builder(
                builder: (context) => // Create a new context using Builder
                    IconButton(
                  icon: Icon(Icons.menu), // Use built-in menu icon
                  color: Colors.white, // Icon color
                  onPressed: () {
                    // Open the end drawer
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 177, 135),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Handle Home tap
                  print('Home tapped');
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle Settings tap
                  print('Settings tapped');
                  Navigator.pop(context);
                  _showSettings(context, themeController);
                  // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  // Handle About tap
                  print('About tapped');
                  Navigator.pop(context); // Close the drawer
                },
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

  // Function to show settings dialog with theme toggle
  void _showSettings(BuildContext context, ThemeController themeController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings'),
          content: Row(
            children: [
              Text('Dark Mode'),
              Obx(() => Switch(
                    value: themeController.isDarkMode.value,
                    onChanged: (value) {
                      themeController.toggleTheme(); // Toggle the theme
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  )),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
