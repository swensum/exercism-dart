class RunLengthEncoder {
  String encode(String input) {
    if (input.isEmpty) {
      return '';
    }

    final result = StringBuffer();
    var count = 1;

    for (var i = 1; i < input.length; i++) {
      if (input[i] == input[i - 1]) {
        count++;
      } else {
        _addEncoded(result, input[i - 1], count);
        count = 1;
      }
    }

    // Add the final group.
    _addEncoded(result, input[input.length - 1], count);

    return result.toString();
  }

  void _addEncoded(StringBuffer result, String character, int count) {
    if (count > 1) {
      result.write(count);
    }

    result.write(character);
  }

  String decode(String input) {
    if (input.isEmpty) {
      return '';
    }

    final result = StringBuffer();
    var count = 0;

    for (var i = 0; i < input.length; i++) {
      final character = input[i];

      if (_isDigit(character)) {
        count = count * 10 + int.parse(character);
      } else {
        if (count == 0) {
          count = 1;
        }

        result.write(character * count);
        count = 0;
      }
    }

    return result.toString();
  }

  bool _isDigit(String character) {
    return character.codeUnitAt(0) >= 48 &&
        character.codeUnitAt(0) <= 57;
  }
}