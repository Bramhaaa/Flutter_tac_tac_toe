import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.cyanAccent,
      scaffoldBackgroundColor: const Color(0xFF1A2A33),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(fontSize: 24.0, color: Colors.white70),
      ),
    );
  }

  static const Color primaryColor = Color(0xFF31C3BD);
  static const Color secondaryColor = Color(0xFFF2B137);
  static const Color tertiaryColor = Color(0xFF4CAF50);
  static const Color quaternaryColor = Color(0xFF9C27B0);
  static const Color dangerColor = Color(0xFFDB3A34);
  static const Color backgroundColor = Color(0xFF1A2A33);
  static const Color cardColor = Color(0xFF1F3641);
}
