import 'package:chatbotapp/view/chat_screen.dart';
import 'package:chatbotapp/bindings/bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: '/chatScreen', page: () => ChatScreen(), binding: ChatBinding())
  ];
}
