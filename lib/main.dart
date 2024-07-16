import 'package:chatbotapp/routes/pages.dart';
import 'package:chatbotapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
