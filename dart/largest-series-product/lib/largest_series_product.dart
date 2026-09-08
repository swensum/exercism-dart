
class LargestSeriesProduct {
  int largestProduct(String digits, int span) {
    // Span cannot be negative.
    if (span < 0) {
      throw ArgumentError('span must not be negative');
    }

    // A span of 0 means an empty product.
    // The empty product is 1.
    if (span == 0) {
      return 1;
    }

    // Span cannot be larger than the input.
    if (span > digits.length) {
      throw ArgumentError(
        'span must be smaller than string length',
      );
    }

    // Make sure every character is a digit.
    for (final digit in digits.runes) {
      if (digit < 48 || digit > 57) {
        throw ArgumentError(
          'digits input must only contain digits',
        );
      }
    }

    var largest = 0;

    // Start each possible series.
    for (var i = 0; i <= digits.length - span; i++) {
      var product = 1;

      // Multiply the digits inside this series.
      for (var j = i; j < i + span; j++) {
        product *= int.parse(digits[j]);
      }

      if (product > largest) {
        largest = product;
      }
    }

    return largest;
  }
}