class ResistorColorTrio {
  final List<String> colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ];
  String label(List<String> input) {
    final first = colors.indexOf(input[0]);
    final second = colors.indexOf(input[1]);
    final zeros = colors.indexOf(input[2]);
    int value = first * 10 + second;
    for (int i = 0; i < zeros; i++) {
      // looping to get larger registor
      value *= 10;
    }
    if (value >= 1000000000) {
      return '${value ~/ 1000000000} gigaohms';
    }
    if (value >= 1000000) {
      return '${value ~/ 1000000} megaohms';
    }
    if (value >= 1000) {
      return '${value ~/ 1000} kiloohms';
    }
    return '$value ohms';
  }
}
