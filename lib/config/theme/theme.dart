import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
  );
}
