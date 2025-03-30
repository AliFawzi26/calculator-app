// lib/core/service/app_themes.dart
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[900],

    // أضف المزيد من الألوان هنا
  );
}