
class PhoneNumber {
  dynamic clean(String value) {
    // Letters are not allowed.
    if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
      throw FormatException('letters not permitted');
    }

    // Only digits, spaces and these punctuation marks are allowed: + - ( ) .
    if (RegExp(r'[^0-9\s().+\-]').hasMatch(value)) {
      throw FormatException('punctuations not permitted');
    }

    // Remove everything except digits.
    var digits = value.replaceAll(RegExp(r'[^0-9]'), '');

    // Must contain at least 10 digits.
    if (digits.length < 10) {
      throw FormatException('must not be fewer than 10 digits');
    }

    // Must not contain more than 11 digits.
    if (digits.length > 11) {
      throw FormatException('must not be greater than 11 digits');
    }

    // If there are 11 digits, the first must be the country code 1.
    if (digits.length == 11) {
      if (!digits.startsWith('1')) {
        throw FormatException('11 digits must start with 1');
      }

      // Remove the country code.
      digits = digits.substring(1);
    }

    // Area code cannot start with 0 or 1.
    if (digits[0] == '0') {
      throw FormatException('area code cannot start with zero');
    }

    if (digits[0] == '1') {
      throw FormatException('area code cannot start with one');
    }

    // Exchange code cannot start with 0 or 1.
    if (digits[3] == '0') {
      throw FormatException('exchange code cannot start with zero');
    }

    if (digits[3] == '1') {
      throw FormatException('exchange code cannot start with one');
    }

    return digits;
  }
}
