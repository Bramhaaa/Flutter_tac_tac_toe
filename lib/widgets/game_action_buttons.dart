import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class GameActionButtons extends StatelessWidget {
  final VoidCallback onNewRound;
  final VoidCallback onResetScore;

  const GameActionButtons({
    super.key,
    required this.onNewRound,
    required this.onResetScore,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0,
      runSpacing: 10.0,
      children: [
        ElevatedButton(
          onPressed: onNewRound,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.secondaryColor,
            foregroundColor: AppTheme.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('New Round'),
        ),
        ElevatedButton(
          onPressed: onResetScore,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.dangerColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh),
              SizedBox(width: 8),
              Text('Reset Score'),
            ],
          ),
        ),
      ],
    );
  }
}
