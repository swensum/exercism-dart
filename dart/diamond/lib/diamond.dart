class Diamond {
  List<String> rows(String letter) {
    final result = <String>[];
    final maxIndex = letter.codeUnitAt(0) - 'A'.codeUnitAt(0);
    //Build the top half, including the middle row
    for (int i = 0; i <= maxIndex; i++) {
      final currentLetter = String.fromCharCode('A'.codeUnitAt(0) + i);
      final outsideSpaces = ' ' * (maxIndex - i);
      //the first row only has one A.
      if (i == 0) {
        result.add('$outsideSpaces$currentLetter$outsideSpaces');
      } else {
        final insideSpaces = ' ' * (2 * i - 1);
        result.add(
          '$outsideSpaces$currentLetter$insideSpaces$currentLetter$outsideSpaces',
        );
      }
    }
    //Add the bottom half by reversing the top half,
    //except for the middle row.
    for (int i = result.length - 2; i >= 0; i--) {
      result.add(result[i]);
    }
    return result;
  }
}
