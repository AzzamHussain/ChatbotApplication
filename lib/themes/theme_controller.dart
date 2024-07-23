import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ThemeController class to handle theme switching
class ThemeController extends GetxController {
  // Reactive variable for storing the theme state
  var isDarkMode = false.obs;

  // Method to toggle theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
