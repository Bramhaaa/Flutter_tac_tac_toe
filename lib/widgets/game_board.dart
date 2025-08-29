import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class GameBoard extends StatelessWidget {
  final List<String> board;
  final int boardSize;
  final List<int> winningLine;
  final String winner;
  final bool isAiThinking;
  final Function(int) onTap;

  const GameBoard({
    super.key,
    required this.board,
    required this.boardSize,
    required this.winningLine,
    required this.winner,
    required this.isAiThinking,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isAiThinking,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: boardSize * boardSize,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: boardSize,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final isWinningCell = winningLine.contains(index);
            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: AppTheme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow:
                      isWinningCell
                          ? [
                            BoxShadow(
                              color:
                                  winner == 'X'
                                      ? Colors.cyanAccent.withOpacity(0.7)
                                      : Colors.orangeAccent.withOpacity(0.7),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                            ),
                          ]
                          : [],
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Text(
                      board[index],
                      key: ValueKey<String>(board[index]),
                      style: TextStyle(
                        fontSize: boardSize == 3 ? 50 : 30,
                        fontWeight: FontWeight.bold,
                        color:
                            board[index] == 'X'
                                ? Colors.cyanAccent
                                : Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
