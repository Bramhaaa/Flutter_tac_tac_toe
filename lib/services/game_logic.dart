class GameLogic {
  static List<int>? checkWinner(
    List<String> board,
    int boardSize,
    int winCondition,
  ) {
    for (int i = 0; i < board.length; i++) {
      String player = board[i];
      if (player.isEmpty) continue;

      // Check horizontal
      if (i % boardSize <= boardSize - winCondition) {
        List<int> line = List.generate(winCondition, (j) => i + j);
        if (line.every((k) => board[k] == player)) {
          return line;
        }
      }
      // Check vertical
      if (i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(winCondition, (j) => i + j * boardSize);
        if (line.every((k) => board[k] == player)) {
          return line;
        }
      }
      // Check diagonal (top-left to bottom-right)
      if (i % boardSize <= boardSize - winCondition &&
          i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(
          winCondition,
          (j) => i + j * (boardSize + 1),
        );
        if (line.every((k) => board[k] == player)) {
          return line;
        }
      }
      // Check diagonal (top-right to bottom-left)
      if (i % boardSize >= winCondition - 1 &&
          i < board.length - boardSize * (winCondition - 1)) {
        List<int> line = List.generate(
          winCondition,
          (j) => i + j * (boardSize - 1),
        );
        if (line.every((k) => board[k] == player)) {
          return line;
        }
      }
    }
    return null;
  }

  static bool isDraw(List<String> board) {
    return !board.contains('');
  }

  static String getWinnerFromLine(List<String> board, List<int> winningLine) {
    return board[winningLine.first];
  }
}
