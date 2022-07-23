import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
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
      ),

      // Floating action button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: primary),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primary, 
          shape: const StadiumBorder(), 
          elevation: 10
        ),
      ),

      // Input decorattion theme
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
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
