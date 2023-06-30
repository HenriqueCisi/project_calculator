class Memory {
  static const List<String> _operations = [
    '%',
    '/',
    '+',
    '-',
    'X',
    '=',
  ];
  String _value = '0';
  String? _operation = '';

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  bool _wipeValue = false;
  String _lastOperation = '';

  String get value {
    return _value;
  }

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      allClear();
      return;
    } else if (_operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastOperation = command;
  }

  _isReplacingOperation(String command) {
    return _operations.contains(_lastOperation) &&
        _operations.contains(command) &&
        _lastOperation != '=' &&
        command != '=';
  }

  void allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }

  void _setOperation(String operation) {
    bool isEqualOperation = operation == '=' ? true : false;
    if (_bufferIndex == 0) {
      if (!isEqualOperation) {
        _bufferIndex = 1;
        _operation = operation;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;

      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualOperation ? null : operation;
      _bufferIndex = isEqualOperation ? 0 : 1;
    }
    _wipeValue = !isEqualOperation;
  }

  void _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';

    final currentValue = wipeValue ? emptyValue : _value;

    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
