import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.orange,
      selectionColor: Colors.orange.withOpacity(0.4),
      selectionHandleColor: Colors.orange,
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
  );

  ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.orange,
      selectionColor: Colors.orange.withOpacity(0.8),
      selectionHandleColor: Colors.orange,
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
  );

  final _getStorage = GetStorage();
  final _themeKey = 'isDarkMode';

  bool isSavedDarkMode() {
    return _getStorage.read(_themeKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(_themeKey, isDarkMode);
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    bool isDarkMode = isSavedDarkMode();
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isDarkMode);
  }

  String get themeImage => isSavedDarkMode() ? "sunn.png" : "night.png";
}
