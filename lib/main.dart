import 'package:chatbotapp/routes/pages.dart';
import 'package:chatbotapp/themes/theme.dart';
import 'package:chatbotapp/themes/theme_controller.dart';
import 'package:chatbotapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create an instance of ThemeController
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Chatbot App',
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const SplashScreen(),
          ),
          ...AppPages.routes, // Use the routes from AppPages
        ],
        theme: lightTheme, // Apply light theme
        darkTheme: darkTheme, // Apply dark theme
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light, // Use GetX to switch themes
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
