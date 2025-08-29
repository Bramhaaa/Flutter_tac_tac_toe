import 'package:flutter/material.dart';
import '../models/game_mode.dart';
import '../utils/app_theme.dart';

class ModeButton extends StatelessWidget {
  final String text;
  final GameMode gameMode;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const ModeButton({
    super.key,
    required this.text,
    required this.gameMode,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppTheme.backgroundColor,
        backgroundColor: color,
        minimumSize: const Size(250, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
