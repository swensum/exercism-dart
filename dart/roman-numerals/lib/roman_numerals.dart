extension ConvertToRomanNumerals on int {
  String toRoman() {
    var number = this;
    var result = '';

    final values = [
      1000,
      900,
      500,
      400,
      100,
      90,
      50,
      40,
      10,
      9,
      5,
      4,
      1,
    ];

    final numerals = [
      'M',
      'CM',
      'D',
      'CD',
      'C',
      'XC',
      'L',
      'XL',
      'X',
      'IX',
      'V',
      'IV',
      'I'
    ];

    for(var i = 0; i < values.length; i++) {
      while(number >= values[i]) {
        result += numerals[i];
        number -= values[i];
      }
    }
    return result;
  }
}
