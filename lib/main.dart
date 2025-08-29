import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

// Main entry point for the Flutter application.
void main() {
  runApp(const TicTacToeApp());
}

// The root widget of the application.
class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic-Tac-Toe',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
