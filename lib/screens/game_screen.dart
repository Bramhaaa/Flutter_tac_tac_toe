import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/game_mode.dart';
import '../models/game_state.dart';
import '../services/ai_service.dart';
import '../services/game_logic.dart';
import '../widgets/game_board.dart';
import '../widgets/score_card.dart';
import '../widgets/game_action_buttons.dart';

class GameScreen extends StatefulWidget {
  final GameMode gameMode;

  const GameScreen({super.key, required this.gameMode});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int _boardSize;
  late int _winCondition;
  late GameState _gameState;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _boardSize = widget.gameMode.boardSize;
    _winCondition = widget.gameMode.winCondition;
    // Initialize with default state first
    _gameState = GameState(
      board: List.filled(_boardSize * _boardSize, ''),
      isPlayerXTurn: true,
    );
    _resetGame();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTurnTimer() {
    _timer?.cancel();
    setState(() {
      _gameState = _gameState.copyWith(timeRemaining: 5);
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_gameState.timeRemaining > 0) {
          _gameState = _gameState.copyWith(
            timeRemaining: _gameState.timeRemaining - 1,
          );
        } else {
          _timer?.cancel();
          _switchTurn();
        }
      });
    });
  }

  void _switchTurn() {
    setState(() {
      _gameState = _gameState.copyWith(
        isPlayerXTurn: !_gameState.isPlayerXTurn,
      );
      if (widget.gameMode == GameMode.timed && !_gameState.isPlayerXTurn) {
        _aiMove();
      } else if (widget.gameMode == GameMode.timed &&
          _gameState.isPlayerXTurn) {
        _startTurnTimer();
      }
    });
  }

  void _resetGame() {
    _timer?.cancel();
    setState(() {
      _gameState = GameState(
        board: List.filled(_boardSize * _boardSize, ''),
        isPlayerXTurn: true,
        scoreX: _gameState.scoreX,
        scoreO: _gameState.scoreO,
      );
    });
    if (widget.gameMode == GameMode.timed) {
      _startTurnTimer();
    }
  }

  void _resetScoreAndGame() {
    setState(() {
      _gameState = GameState(
        board: List.filled(_boardSize * _boardSize, ''),
        isPlayerXTurn: true,
      );
    });
    if (widget.gameMode == GameMode.timed) {
      _startTurnTimer();
    }
  }

  void _handleTap(int index) {
    HapticFeedback.lightImpact();

    if (_gameState.board[index].isNotEmpty ||
        _gameState.isGameOver ||
        _gameState.isAiThinking) {
      return;
    }

    List<String> newBoard = List.from(_gameState.board);
    newBoard[index] = _gameState.isPlayerXTurn ? 'X' : 'O';

    _checkWinnerAndUpdateState(newBoard);

    if (widget.gameMode == GameMode.timed && !_gameState.isGameOver) {
      _startTurnTimer();
    }

    if (widget.gameMode.isAiMode &&
        !_gameState.isPlayerXTurn &&
        !_gameState.isGameOver) {
      _aiMove();
    }
  }

  void _checkWinnerAndUpdateState(List<String> board) {
    List<int>? winningLine = GameLogic.checkWinner(
      board,
      _boardSize,
      _winCondition,
    );

    setState(() {
      _gameState = _gameState.copyWith(
        board: board,
        isPlayerXTurn:
            _gameState.isGameOver
                ? _gameState.isPlayerXTurn
                : !_gameState.isPlayerXTurn,
      );

      if (winningLine != null) {
        String winner = GameLogic.getWinnerFromLine(board, winningLine);
        _timer?.cancel();
        _gameState = _gameState.copyWith(
          winner: winner,
          winningLine: winningLine,
          scoreX: winner == 'X' ? _gameState.scoreX + 1 : _gameState.scoreX,
          scoreO: winner == 'O' ? _gameState.scoreO + 1 : _gameState.scoreO,
        );
      } else if (GameLogic.isDraw(board)) {
        _gameState = _gameState.copyWith(isDraw: true);
      }
    });
  }

  void _aiMove() {
    setState(() {
      _gameState = _gameState.copyWith(isAiThinking: true);
    });

    Timer(const Duration(milliseconds: 600), () {
      int? bestMove = AiService.findBestMove(
        List.from(_gameState.board),
        _boardSize,
        _winCondition,
      );

      if (bestMove != null) {
        List<String> newBoard = List.from(_gameState.board);
        newBoard[bestMove] = 'O';

        _checkWinnerAndUpdateState(newBoard);

        setState(() {
          _gameState = _gameState.copyWith(isAiThinking: false);
        });

        if (widget.gameMode == GameMode.timed && !_gameState.isGameOver) {
          _startTurnTimer();
        }
      } else {
        setState(() {
          _gameState = _gameState.copyWith(isAiThinking: false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.gameMode.appBarTitle,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (widget.gameMode == GameMode.timed) _buildTimerDisplay(),
              _buildScoreboard(),
              _buildStatus(),
              GameBoard(
                board: _gameState.board,
                boardSize: _boardSize,
                winningLine: _gameState.winningLine,
                winner: _gameState.winner,
                isAiThinking: _gameState.isAiThinking,
                onTap: _handleTap,
              ),
              GameActionButtons(
                onNewRound: _resetGame,
                onResetScore: _resetScoreAndGame,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerDisplay() {
    return Column(
      children: [
        Text(
          'Time Remaining: ${_gameState.timeRemaining}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildStatus() {
    String status;
    Color color = Colors.white;
    String playerX = widget.gameMode.isAiMode ? 'You' : 'Player X';
    String playerO = widget.gameMode.isAiMode ? 'AI' : 'Player O';

    if (_gameState.winner.isNotEmpty) {
      status = '${_gameState.winner == 'X' ? playerX : playerO} Wins!';
      color =
          _gameState.winner == 'X' ? Colors.cyanAccent : Colors.orangeAccent;
    } else if (_gameState.isDraw) {
      status = 'It\'s a Draw!';
      color = Colors.grey[400]!;
    } else {
      if (widget.gameMode.isAiMode && !_gameState.isPlayerXTurn) {
        status = 'AI is thinking...';
      } else if (widget.gameMode.isAiMode && _gameState.isPlayerXTurn) {
        status = 'Your Turn';
      } else {
        status = '${_gameState.isPlayerXTurn ? playerX : playerO}\'s Turn';
      }
      color =
          _gameState.isPlayerXTurn ? Colors.cyanAccent : Colors.orangeAccent;
    }

    return Text(
      status,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget _buildScoreboard() {
    String playerXLabel = widget.gameMode.isAiMode ? 'You (X)' : 'Player X';
    String playerOLabel = widget.gameMode.isAiMode ? 'AI (O)' : 'Player O';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ScoreCard(
          player: playerXLabel,
          score: _gameState.scoreX,
          color: Colors.cyan,
        ),
        ScoreCard(
          player: playerOLabel,
          score: _gameState.scoreO,
          color: Colors.orange,
        ),
      ],
    );
  }
}
