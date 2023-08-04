import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      inverseSurface: Colors.white,
      surfaceVariant: Colors.grey.shade900,
      surfaceTint: Colors.grey.shade900,
      secondaryContainer: Colors.grey.shade800,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
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
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.dark(
      background: Colors.white,
      inverseSurface: Colors.black,
      surfaceVariant: Colors.grey.shade300,
      surfaceTint: Colors.grey.shade100,
      secondaryContainer: Colors.grey.shade300,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
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
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.black),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
  );
}
