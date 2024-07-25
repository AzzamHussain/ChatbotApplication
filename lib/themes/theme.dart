import 'package:flutter/material.dart';

// Define the light theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 37, 177, 135),
    titleTextStyle: TextStyle(
      color: Colors.white, // White text color for AppBar in light mode
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Main text color for light mode
    bodyMedium: TextStyle(color: Colors.black), // Secondary text color
    titleMedium: TextStyle(color: Colors.black), // Subtitle text color
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.grey), // Hint text color for light mode
    labelStyle: const TextStyle(color: Colors.black), // Label text color for light mode
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 37, 177, 135),
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
  ),
);

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white, // White text color for AppBar in dark mode
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Main text color for dark mode
    bodyMedium: TextStyle(color: Colors.white70), // Secondary text color
    titleMedium: TextStyle(color: Colors.white60), // Subtitle text color
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.white60), // Hint text color for dark mode
    labelStyle: const TextStyle(color: Colors.white), // Label text color for dark mode
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.teal,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.white60,
        width: 1.0,
      ),
    ),
  ),
);
