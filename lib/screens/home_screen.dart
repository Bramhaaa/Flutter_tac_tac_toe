import 'package:flutter/material.dart';
import '../models/game_mode.dart';
import '../widgets/mode_button.dart';
import '../utils/app_theme.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tic-Tac-Toe',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              ModeButton(
                text: GameMode.pvp.displayName,
                gameMode: GameMode.pvp,
                icon: Icons.people,
                color: AppTheme.primaryColor,
                onPressed: () => _navigateToGame(context, GameMode.pvp),
              ),
              const SizedBox(height: 20),
              ModeButton(
                text: GameMode.pve.displayName,
                gameMode: GameMode.pve,
                icon: Icons.computer,
                color: AppTheme.secondaryColor,
                onPressed: () => _navigateToGame(context, GameMode.pve),
              ),
              const SizedBox(height: 20),
              ModeButton(
                text: GameMode.bigBoard.displayName,
                gameMode: GameMode.bigBoard,
                icon: Icons.grid_on,
                color: AppTheme.tertiaryColor,
                onPressed: () => _navigateToGame(context, GameMode.bigBoard),
              ),
              const SizedBox(height: 20),
              ModeButton(
                text: GameMode.timed.displayName,
                gameMode: GameMode.timed,
                icon: Icons.timer,
                color: AppTheme.quaternaryColor,
                onPressed: () => _navigateToGame(context, GameMode.timed),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToGame(BuildContext context, GameMode gameMode) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(gameMode: gameMode)),
    );
  }
}
