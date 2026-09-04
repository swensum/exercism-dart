class PrimeFactors {
  List<int> factors(int number) {
    final result = <int>[];
    var divisor = 2;
    while (number > 1) {
      if (number % divisor == 0) {
        result.add(divisor);
        number ~/= divisor;
      } else {
        divisor++;
      }
    }
    return result;
  }
}
