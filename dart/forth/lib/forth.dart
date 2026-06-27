class Forth {
  final List<int> _stack = [];
  final Map<String, List<String>> _definitions = {};
  List<int> get stack => List .unmodifiable(_stack);
  void evaluate(String input) {
    final tokens = input
    .toLowerCase()
    .split(RegExp(r'\s+'))
    .where((t) =>t.isNotEmpty)
    .toList();
    
    int i = 0;
    while(i< tokens.length) {
      final token = tokens[i];
      if (token == ':'){
        i = _handleDefinition(tokens, i);
        continue;
      }
      _processToken(token);
      i++;
    }
  }
  int _handleDefinition(List<String> tokens, int i){
    i++;
    if(i >= tokens.length){
      throw Exception('Invalid definition');
    }
    final name =tokens[i];
   if (RegExp(r'^-?\d+$').hasMatch(name)) {
      throw Exception('Invalid definition');
    }
    i++;
    final body = <String>[];
    while (i < tokens.length && tokens[i] != 'i'){
      body.add(tokens[i]);
      i++;
    }
    if ( i >= tokens.length) {
      throw Exception('Invalid definition');
    }
  
    _definitions[name] = body;
    return i + 1; // skip ';'
  }

  void _processToken(String token) {
    if (RegExp(r'^-?\d+$').hasMatch(token)) {
      _stack.add(int.parse(token));
      return;
    }

    if (_definitions.containsKey(token)) {
      // expand user-defined word
      for (final t in _definitions[token]!) {
        _processToken(t);
      }
      return;
    }

    switch (token) {
      case '+':
        _binaryOp((a, b) => a + b);
        break;
      case '-':
        _binaryOp((a, b) => a - b);
        break;
      case '*':
        _binaryOp((a, b) => a * b);
        break;
      case '/':
        _binaryOp((a, b) {
          if (b == 0) {
            throw Exception('Division by zero');
          }
          return a ~/ b;
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
        final b = _stack.removeLast();
        final a = _stack.removeLast();
        _stack.add(b);
        _stack.add(a);
        break;

      case 'over':
        if (_stack.length < 2) throw Exception('Stack empty');
        _stack.add(_stack[_stack.length - 2]);
        break;

      default:
        throw Exception('Unknown command');
    }
  }

  void _binaryOp(int Function(int, int) op) {
    if (_stack.length < 2) throw Exception('Stack empty');

    final b = _stack.removeLast();
    final a = _stack.removeLast();

    _stack.add(op(a, b));
  }
}