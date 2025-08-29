import 'dart:math';

class AiService {
  static int? findBestMove(
    List<String> board,
    int boardSize,
    int winCondition,
  ) {
    // AI logic for 3x3 board
    if (boardSize == 3) {
      // 1. AI checks if it can win in the next move.
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          if (_isWinner(board, 'O', boardSize, winCondition)) {
            board[i] = '';
            return i;
          }
          board[i] = '';
        }
      }

      // 2. AI checks if the player is about to win and blocks them.
      for (int i = 0; i < 9; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          if (_isWinner(board, 'X', boardSize, winCondition)) {
            board[i] = '';
            return i;
          }
          board[i] = '';
        }
      }

      // 3. AI tries to take the center square if available.
      if (board[4] == '') return 4;

      // 4. AI tries to take a random corner.
      List<int> corners = [0, 2, 6, 8];
      corners.shuffle();
      for (int i in corners) {
        if (board[i] == '') return i;
      }
    }

    // Fallback for 5x5 or if no strategic move is found for 3x3
    List<int> availableSpots = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        availableSpots.add(i);
      }
    }
    if (availableSpots.isNotEmpty) {
      return availableSpots[Random().nextInt(availableSpots.length)];
    }

    return null; // No available moves.
  }

  static bool _isWinner(
    List<String> board,
    String player,
    int boardSize,
    int winCondition,
  ) {
    for (int i = 0; i < board.length; i++) {
      // Check horizontal
      if (i % boardSize <= boardSize - winCondition) {
        List<int> line = List.generate(winCondition, (j) => i + j);
        if (line.every((k) => board[k] == player)) return true;
      }
      // Check vertical
      if (i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(winCondition, (j) => i + j * boardSize);
        if (line.every((k) => board[k] == player)) return true;
      }
      // Check diagonal (top-left to bottom-right)
      if (i % boardSize <= boardSize - winCondition &&
          i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(
          winCondition,
          (j) => i + j * (boardSize + 1),
        );
        if (line.every((k) => board[k] == player)) return true;
      }
      // Check diagonal (top-right to bottom-left)
      if (i % boardSize >= winCondition - 1 &&
          i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(
          winCondition,
          (j) => i + j * (boardSize - 1),
        );
        if (line.every((k) => board[k] == player)) return true;
      }
    }
    return false;
  }
}
