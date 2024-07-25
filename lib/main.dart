import 'package:chatbotapp/routes/pages.dart';
import 'package:chatbotapp/themes/theme.dart';
import 'package:chatbotapp/themes/theme_controller.dart';
import 'package:chatbotapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Instantiate the ThemeController
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Chatbot App',
      theme: lightTheme, // Use the light theme
      darkTheme: darkTheme, // Use the dark theme
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        ...AppPages.routes, // Use the routes from AppPages
      ],
      debugShowCheckedModeBanner: false,
    ));
  }
}
