class GameState {
  final List<String> board;
  final bool isPlayerXTurn;
  final String winner;
  final bool isDraw;
  final int scoreX;
  final int scoreO;
  final List<int> winningLine;
  final bool isAiThinking;
  final int timeRemaining;

  const GameState({
    required this.board,
    required this.isPlayerXTurn,
    this.winner = '',
    this.isDraw = false,
    this.scoreX = 0,
    this.scoreO = 0,
    this.winningLine = const [],
    this.isAiThinking = false,
    this.timeRemaining = 5,
  });

  GameState copyWith({
    List<String>? board,
    bool? isPlayerXTurn,
    String? winner,
    bool? isDraw,
    int? scoreX,
    int? scoreO,
    List<int>? winningLine,
    bool? isAiThinking,
    int? timeRemaining,
  }) {
    return GameState(
      board: board ?? this.board,
      isPlayerXTurn: isPlayerXTurn ?? this.isPlayerXTurn,
      winner: winner ?? this.winner,
      isDraw: isDraw ?? this.isDraw,
      scoreX: scoreX ?? this.scoreX,
      scoreO: scoreO ?? this.scoreO,
      winningLine: winningLine ?? this.winningLine,
      isAiThinking: isAiThinking ?? this.isAiThinking,
      timeRemaining: timeRemaining ?? this.timeRemaining,
    );
  }

  bool get isGameOver => winner.isNotEmpty || isDraw;
}
