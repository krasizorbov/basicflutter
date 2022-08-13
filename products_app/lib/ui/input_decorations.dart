import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String labelText,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      suffixIcon: suffixIcon != null ? Icon(
        suffixIcon,
        color: Colors.indigo,
      ) : null
    );
  }
}
