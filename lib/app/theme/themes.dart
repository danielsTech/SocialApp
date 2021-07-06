import 'package:flutter/material.dart';

class AppThemes {
  static final _darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    // primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white),
  );
  static ThemeData get darkTheme => _darkTheme;

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
    // primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black),
  );
  static ThemeData get lightTheme => _lightTheme;
}
