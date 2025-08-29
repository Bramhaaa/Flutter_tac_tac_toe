// Define an enum for the different game modes.
enum GameMode { pvp, pve, bigBoard, timed }

extension GameModeExtension on GameMode {
  String get displayName {
    switch (this) {
      case GameMode.pvp:
        return 'Player vs. Player';
      case GameMode.pve:
        return 'Player vs. AI';
      case GameMode.bigBoard:
        return 'Big Board (5x5)';
      case GameMode.timed:
        return 'Timed Player vs. AI';
    }
  }

  String get appBarTitle {
    switch (this) {
      case GameMode.pvp:
        return 'Player vs. Player';
      case GameMode.pve:
        return 'Player vs. AI';
      case GameMode.bigBoard:
        return 'Big Board (5x5)';
      case GameMode.timed:
        return 'Timed Player vs. AI';
    }
  }

  bool get isAiMode {
    return this == GameMode.pve ||
        this == GameMode.bigBoard ||
        this == GameMode.timed;
  }

  int get boardSize {
    return this == GameMode.bigBoard ? 5 : 3;
  }

  int get winCondition {
    return this == GameMode.bigBoard ? 5 : 3;
  }
}
