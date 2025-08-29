# 🎮 Flutter Tic-Tac-Toe

A modern, feature-rich Tic-Tac-Toe game built with Flutter, featuring multiple game modes, AI opponents, and a clean architecture design.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## 🌟 Features

### 🎯 Multiple Game Modes

#### 1. **Player vs. Player** 
- Classic 3x3 Tic-Tac-Toe for two human players
- Turn-based gameplay with visual indicators
- Score tracking across multiple rounds

#### 2. **Player vs. AI**
- Challenge yourself against an intelligent AI opponent
- Strategic AI that can win and block opponent moves
- Difficulty-balanced for engaging gameplay

#### 3. **Big Board (5x5)**
- Expanded gameplay on a 5x5 grid
- **Win condition: Get 5 in a row** (horizontally, vertically, or diagonally)
- AI opponent with adapted strategy for larger board
- More strategic depth and longer games

#### 4. **Timed Player vs. AI**
- Fast-paced gameplay with 5-second turn timer
- Race against time while playing against AI
- Automatic turn forfeiture if time runs out
- Adds excitement and pressure to traditional gameplay

### 🤖 Smart AI Features

- **Strategic Decision Making**: AI prioritizes winning moves and blocking opponent threats
- **Center Control**: AI recognizes the importance of center positions
- **Corner Strategy**: Intelligent corner placement when center is unavailable
- **Adaptive Logic**: Different strategies for 3x3 and 5x5 boards
- **Realistic Thinking Delay**: Simulated "thinking" time for natural feel

### 🎨 User Experience

- **Haptic Feedback**: Tactile response on every move
- **Smooth Animations**: 
  - Animated piece placement with scale transitions
  - Winning line highlighting with glowing effects
  - Smooth state transitions
- **Visual Feedback**:
  - Color-coded players (Cyan for X, Orange for O)
  - Winning combinations highlighted
  - Turn indicators and game status
- **Responsive Design**: Clean dark theme optimized for mobile devices

### ⚡ Technical Features

- **Clean Architecture**: Well-organized codebase with separation of concerns
- **State Management**: Efficient game state handling
- **Modular Design**: Reusable components and services
- **Performance Optimized**: Smooth 60fps gameplay
- **Memory Efficient**: Proper timer and resource management

## 🏗️ Architecture

### File Structure
```
lib/
├── models/
│   ├── game_mode.dart      # Game mode enum and extensions
│   └── game_state.dart     # Immutable game state management
├── services/
│   ├── ai_service.dart     # AI logic and strategy
│   └── game_logic.dart     # Core game rules and win detection
├── screens/
│   ├── home_screen.dart    # Main menu
│   └── game_screen.dart    # Game interface
├── widgets/
│   ├── game_board.dart     # Interactive game grid
│   ├── score_card.dart     # Score display component
│   ├── mode_button.dart    # Mode selection button
│   └── game_action_buttons.dart # Reset buttons
├── utils/
│   └── app_theme.dart      # Theme and color constants
└── main.dart               # App entry point
```

### Design Patterns
- **Clean Architecture**: Separation of business logic, UI, and data
- **State Pattern**: Immutable game state with copy methods
- **Strategy Pattern**: Different AI strategies for different board sizes
- **Component Pattern**: Reusable UI widgets

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or later)
- Dart (3.0 or later)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Bramhaaa/Flutter_tac_tac_toe.git
   cd Flutter_tac_tac_toe
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎮 How to Play

### Basic Gameplay
1. **Select Game Mode**: Choose from four available game modes on the home screen
2. **Make Your Move**: Tap on any empty cell to place your mark
3. **Win Condition**: 
   - **3x3 boards**: Get 3 in a row (horizontal, vertical, or diagonal)
   - **5x5 board**: Get 5 in a row (horizontal, vertical, or diagonal)
4. **Score Tracking**: Wins are automatically tracked across rounds

### Game Controls
- **New Round**: Start a fresh game while keeping scores
- **Reset Score**: Clear all scores and start over
- **Back Button**: Return to mode selection
- **Timer** (Timed mode): Watch the countdown and make quick decisions!

## 🔧 Technical Details

### AI Implementation
```dart
// Strategic AI decision making
1. Check for winning moves
2. Block opponent winning moves  
3. Take center position (3x3)
4. Take corner positions
5. Random fallback for remaining moves
```

### Game State Management
```dart
class GameState {
  final List<String> board;
  final bool isPlayerXTurn;
  final String winner;
  final bool isDraw;
  final int scoreX, scoreO;
  final List<int> winningLine;
  final bool isAiThinking;
  final int timeRemaining;
}
```

### Performance Optimizations
- Efficient win detection algorithms
- Minimal widget rebuilds
- Proper timer disposal
- Memory leak prevention

## 🎨 Customization

### Theme Colors
The app uses a carefully crafted dark theme with accent colors:
- **Primary**: Cyan Accent (#31C3BD)
- **Secondary**: Orange (#F2B137) 
- **Success**: Green (#4CAF50)
- **Accent**: Purple (#9C27B0)
- **Danger**: Red (#DB3A34)

### Adding New Game Modes
1. Add new enum value to `GameMode`
2. Implement game logic in `GameLogic`
3. Update UI components
4. Add AI strategy if needed

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Test Coverage
- Unit tests for game logic
- Widget tests for UI components
- Integration tests for complete flows

## 📱 Screenshots

| Home Screen | 3x3 Gameplay | 5x5 Big Board | Timed Mode |
|-------------|--------------|---------------|------------|
| *Mode selection with beautiful buttons* | *Classic tic-tac-toe* | *Extended 5x5 gameplay* | *Fast-paced timed matches* |

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Future Enhancements

- [ ] Online multiplayer functionality
- [ ] Tournament mode
- [ ] Difficulty levels for AI
- [ ] Custom board sizes
- [ ] Sound effects and music
- [ ] Achievement system
- [ ] Replay system
- [ ] Statistics and analytics

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Bramhaaa**
- GitHub: [@Bramhaaa](https://github.com/Bramhaaa)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI inspiration
- Open source community for continuous learning

---

### ⭐ If you found this project helpful, please give it a star!

**Built with ❤️ using Flutter**
