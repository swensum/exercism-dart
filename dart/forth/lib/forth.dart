class Forth {
  List<int> _stack = [];
  Map<String, List<String>> _userWords = {};

  List<int> get stack => List.unmodifiable(_stack);

  void evaluate(String input) {
    List<String> tokens = _tokenize(input);
    int i = 0;
    
    while (i < tokens.length) {
      String token = tokens[i];
      String lowerToken = token.toLowerCase();
      
      if (lowerToken == ':') {
        // Handle word definition
        if (i + 1 >= tokens.length) {
          throw Exception('Invalid definition');
        }
        
        String wordName = tokens[i + 1].toLowerCase();
        if (_isNumber(wordName)) {
          throw Exception('Invalid definition');
        }
        
        // Find the matching semicolon
        int semicolonIndex = -1;
        for (int j = i + 2; j < tokens.length; j++) {
          if (tokens[j].toLowerCase() == ';') {
            semicolonIndex = j;
            break;
          }
        }
        
        if (semicolonIndex == -1) {
          throw Exception('Invalid definition');
        }
        
        // Extract and expand the definition tokens
        List<String> definition = [];
        for (int j = i + 2; j < semicolonIndex; j++) {
          String tokenToAdd = tokens[j].toLowerCase();
          // If the token is a user-defined word, expand it
          if (_userWords.containsKey(tokenToAdd)) {
            definition.addAll(_userWords[tokenToAdd]!);
          } else {
            definition.add(tokenToAdd);
          }
        }
        
        // Store the expanded definition
        _userWords[wordName] = definition;
        i = semicolonIndex + 1;
      } else {
        _executeToken(lowerToken);
        i++;
      }
    }
  }

  List<String> _tokenize(String input) {
    return input.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList();
  }

  bool _isNumber(String token) {
    if (token.isEmpty) return false;
    int i = 0;
    if (token[0] == '-') {
      if (token.length == 1) return false;
      i = 1;
    }
    for (; i < token.length; i++) {
      if (token.codeUnitAt(i) < 48 || token.codeUnitAt(i) > 57) {
        return false;
      }
    }
    return true;
  }

  void _executeToken(String token) {
    // Check if it's a number
    if (_isNumber(token)) {
      _stack.add(int.parse(token));
      return;
    }
    
    // Check if it's a user-defined word
    if (_userWords.containsKey(token)) {
      // Execute the definition
      List<String> definition = _userWords[token]!;
      for (String word in definition) {
        _executeToken(word);
      }
      return;
    }
    
    // Handle built-in operations
    switch (token) {
      case '+':
        _binaryOperation((a, b) => a + b);
        break;
      case '-':
        _binaryOperation((a, b) => a - b);
        break;
      case '*':
        _binaryOperation((a, b) => a * b);
        break;
      case '/':
        _binaryOperation((a, b) {
          if (b == 0) throw Exception('Division by zero');
          return (a / b).truncate();
        });
        break;
      case 'dup':
        if (_stack.isEmpty) throw Exception('Stack empty');
        _stack.add(_stack.last);
        break;
      case 'drop':
        if (_stack.isEmpty) throw Exception('Stack empty');
        _stack.removeLast();
        break;
      case 'swap':
        if (_stack.length < 2) throw Exception('Stack empty');
        int a = _stack.removeLast();
        int b = _stack.removeLast();
        _stack.add(a);
        _stack.add(b);
        break;
      case 'over':
        if (_stack.length < 2) throw Exception('Stack empty');
        _stack.add(_stack[_stack.length - 2]);
        break;
      default:
        throw Exception('Unknown command');
    }
  }

  void _binaryOperation(int Function(int, int) operation) {
    if (_stack.length < 2) throw Exception('Stack empty');
    int b = _stack.removeLast();
    int a = _stack.removeLast();
    _stack.add(operation(a, b));
  }
}