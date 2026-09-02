class Luhn {
  bool valid(String value) {
    value = value.replaceAll(' ', '');

    if (value.length <= 1) {
      return false;
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return false;
    }
    int sum = 0;
    bool shouldDouble = false;

    for (int i = value.length - 1; i >= 0; i--) {
      int digit = int.parse(value[i]);

      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }
    return sum % 10 == 0;
  }
}
