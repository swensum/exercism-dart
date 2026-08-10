class Bob {
  String response(String message) {
    final trimmed = message.trim();
    //silence
    if (trimmed.isEmpty) {
      return 'Fine. Be that way!';
    }
    // Check whether there are any letters.
    final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(trimmed);
    // Yelling means there is at least one letter
    // and all letters are uppercase.
    final isYelling = hasLetters && trimmed == trimmed.toUpperCase();
    // A question ends with '?' after removing whitespace.
    final isQuestion = trimmed.endsWith('?');

    if (isYelling && isQuestion) {
      return "Calm down, I know what I'm doing!";
    }
    if (isYelling) {
      return 'Whoa, chill out!';
    }
    if (isQuestion) {
      return 'Sure.';
    }
    return 'Whatever.';
  }
}
