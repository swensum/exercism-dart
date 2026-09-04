class RotationalCipher {
  String rotate({required String text, required int shiftKey}) {
    final result = StringBuffer();
    final shift = shiftKey % 26;

    for (final char in text.split('')) {
      //Lowercase letters
      if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
          char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        final position = char.codeUnitAt(0) - 'a'.codeUnitAt(0);
        final newPosition = (position + shift) % 26;
        result.write(String.fromCharCode(newPosition + 'a'.codeUnitAt(0)));
      }
      //Uppercase letters
      else if (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) &&
          char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        final position = char.codeUnitAt(0) - 'A'.codeUnitAt(0);
        final newPosition = (position + shift) % 26;
        result.write(String.fromCharCode(newPosition + 'A'.codeUnitAt(0)));
      }
      //Spaces, numbers, punctuation
      else {
        result.write(char);
      }
    }
    return result.toString();
  }
}
