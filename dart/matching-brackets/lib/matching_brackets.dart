
class MatchingBrackets {
  bool isPaired(String value) {
    final stack = <String>[];

    for (final char in value.split('')) {
      // Opening brackets
      if (char == '(' || char == '[' || char == '{') {
        stack.add(char);
      }

      // Closing brackets
      else if (char == ')' || char == ']' || char == '}') {
        // Closing bracket without an opening bracket
        if (stack.isEmpty) {
          return false;
        }

        final opening = stack.removeLast();

        // Check matching pair
        if (char == ')' && opening != '(') {
          return false;
        }

        if (char == ']' && opening != '[') {
          return false;
        }

        if (char == '}' && opening != '{') {
          return false;
        }
      }

      // Anything else is ignored
    }

    // All opening brackets must have been closed
    return stack.isEmpty;
  }
}