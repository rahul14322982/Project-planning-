# Simple Calculator - Flutter App

A beautiful and functional calculator app built with Flutter.

## Features

- **Basic Operations**: Addition (+), Subtraction (-), Multiplication (×), Division (÷)
- **Clear Function**: Clear button (C) to reset the calculator
- **Decimal Support**: Decimal point operations
- **Modern UI**: Dark theme with clean button layout
- **Responsive Design**: Works on different screen sizes

## Screenshots

The calculator features a sleek dark interface with:
- Large display area showing current number/result
- Color-coded buttons (orange for operations, gray for numbers)
- Rounded button design for modern look

## How to Use

1. **Basic Operations**:
   - Tap number buttons (0-9) to input numbers
   - Tap operation buttons (+, -, ×, ÷) to perform calculations
   - Tap equals (=) to see the result

2. **Clear**: 
   - Tap 'C' to clear the display and reset the calculator

3. **Decimal Numbers**:
   - Tap '.' to add decimal points to numbers

## Calculator Layout

```
┌─────────────────────────┐
│         Display         │
├─────────────────────────┤
│  C  │ ± │ % │ ÷ │
├─────────────────────────┤
│  7  │ 8 │ 9 │ × │
├─────────────────────────┤
│  4  │ 5 │ 6 │ - │
├─────────────────────────┤
│  1  │ 2 │ 3 │ + │
├─────────────────────────┤
│   0     │ . │ = │
└─────────────────────────┘
```

## Running the App

### Prerequisites
- Flutter SDK installed
- An IDE like VS Code or Android Studio (optional)

### Steps to Run

1. **Navigate to the project directory**:
   ```bash
   cd simple_calculator
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Platform Support

This calculator can run on:
- **Android**: Requires Android SDK setup
- **iOS**: Requires Xcode (macOS only)
- **Web**: Works in web browsers
- **Desktop**: Linux, Windows, macOS

## Development

### Project Structure

```
simple_calculator/
├── lib/
│   └── main.dart          # Main calculator implementation
├── test/
│   └── widget_test.dart   # Widget tests
├── pubspec.yaml           # Project dependencies
└── README.md             # This file
```

### Key Components

- **CalculatorApp**: Main app widget
- **Calculator**: Stateful widget containing calculator logic
- **_CalculatorState**: Handles calculator operations and UI state

### Running Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

## Architecture

The calculator uses a simple state management approach:

- **Display State**: Current number or result shown to user
- **Operation State**: Currently selected operation (+, -, ×, ÷)
- **Previous Number**: Previously entered number for calculations
- **Waiting for Operand**: Flag to handle operation flow

## Future Enhancements

Potential features that could be added:
- Memory functions (M+, M-, MR, MC)
- Scientific calculator functions
- History of calculations
- Keyboard input support
- Custom themes/colors
- Sound effects

## License

This project is open source and available under the MIT License.

## Contributing

Feel free to contribute to this project by:
1. Forking the repository
2. Creating a feature branch
3. Making your changes
4. Adding tests for new features
5. Submitting a pull request

---

Built with ❤️ using Flutter
