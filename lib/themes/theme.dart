import 'package:flutter/material.dart';

// Define the light theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 37, 177, 135),
  ),
  scaffoldBackgroundColor: Colors.white,
);

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
  ),
  scaffoldBackgroundColor: Color(0xFF121212),
);
