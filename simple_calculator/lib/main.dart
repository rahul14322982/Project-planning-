import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _display = '0';
  String _previousNumber = '';
  String _operation = '';
  bool _waitingForOperand = false;

  void _inputNumber(String number) {
    setState(() {
      if (_waitingForOperand) {
        _display = number;
        _waitingForOperand = false;
      } else {
        _display = _display == '0' ? number : '$_display$number';
      }
    });
  }

  void _inputOperation(String nextOperation) {
    double inputValue = double.parse(_display);

    if (_previousNumber.isEmpty) {
      _previousNumber = inputValue.toString();
    } else if (_operation.isNotEmpty) {
      double prevValue = double.parse(_previousNumber);
      double result = _calculate(prevValue, inputValue, _operation);
      
      setState(() {
        _display = _formatNumber(result);
        _previousNumber = result.toString();
      });
    }

    setState(() {
      _waitingForOperand = true;
      _operation = nextOperation;
    });
  }

  double _calculate(double firstOperand, double secondOperand, String operation) {
    switch (operation) {
      case '+':
        return firstOperand + secondOperand;
      case '-':
        return firstOperand - secondOperand;
      case '×':
        return firstOperand * secondOperand;
      case '÷':
        return firstOperand / secondOperand;
      default:
        return secondOperand;
    }
  }

  void _performCalculation() {
    double inputValue = double.parse(_display);

    if (_previousNumber.isNotEmpty && _operation.isNotEmpty) {
      double prevValue = double.parse(_previousNumber);
      double result = _calculate(prevValue, inputValue, _operation);
      
      setState(() {
        _display = _formatNumber(result);
        _previousNumber = '';
        _operation = '';
        _waitingForOperand = true;
      });
    }
  }

  void _clear() {
    setState(() {
      _display = '0';
      _previousNumber = '';
      _operation = '';
      _waitingForOperand = false;
    });
  }

  void _inputDecimal() {
    setState(() {
      if (_waitingForOperand) {
        _display = '0.';
        _waitingForOperand = false;
      } else if (!_display.contains('.')) {
        _display = '$_display.';
      }
    });
  }

  String _formatNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  Widget _buildButton(String text, {Color? color, Color? textColor, VoidCallback? onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[300],
            foregroundColor: textColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Simple Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Text(
              _display,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
          
          const Divider(color: Colors.grey, height: 1),
          
          // Buttons
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // First row
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          'C',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: _clear,
                        ),
                        _buildButton(
                          '±',
                          color: Colors.grey[600],
                          textColor: Colors.white,
                          onPressed: () {}, // Placeholder for sign change
                        ),
                        _buildButton(
                          '%',
                          color: Colors.grey[600],
                          textColor: Colors.white,
                          onPressed: () {}, // Placeholder for percentage
                        ),
                        _buildButton(
                          '÷',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () => _inputOperation('÷'),
                        ),
                      ],
                    ),
                  ),
                  
                  // Second row
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '7',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('7'),
                        ),
                        _buildButton(
                          '8',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('8'),
                        ),
                        _buildButton(
                          '9',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('9'),
                        ),
                        _buildButton(
                          '×',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () => _inputOperation('×'),
                        ),
                      ],
                    ),
                  ),
                  
                  // Third row
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '4',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('4'),
                        ),
                        _buildButton(
                          '5',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('5'),
                        ),
                        _buildButton(
                          '6',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('6'),
                        ),
                        _buildButton(
                          '-',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () => _inputOperation('-'),
                        ),
                      ],
                    ),
                  ),
                  
                  // Fourth row
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '1',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('1'),
                        ),
                        _buildButton(
                          '2',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('2'),
                        ),
                        _buildButton(
                          '3',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: () => _inputNumber('3'),
                        ),
                        _buildButton(
                          '+',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () => _inputOperation('+'),
                        ),
                      ],
                    ),
                  ),
                  
                  // Fifth row
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 2,
                              ),
                              onPressed: () => _inputNumber('0'),
                              child: const Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildButton(
                          '.',
                          color: Colors.grey[700],
                          textColor: Colors.white,
                          onPressed: _inputDecimal,
                        ),
                        _buildButton(
                          '=',
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: _performCalculation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
