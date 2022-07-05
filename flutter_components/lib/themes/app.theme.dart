import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // Color primary
      primaryColor: primary,
      // Appbar theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      // TextButton theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary)
      )
    );
      
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
  // Color primary
  primaryColor: Colors.indigo,
  // Appbar theme
  appBarTheme: const AppBarTheme(
    color: primary,
    elevation: 0,
    
  ),
    scaffoldBackgroundColor: Colors.black87
  );
      
}
