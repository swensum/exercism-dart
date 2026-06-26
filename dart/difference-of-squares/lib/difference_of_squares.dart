class DifferenceOfSquares {
  int squareOfSum(int number) {
    int sum = 0;
    for (int i = 1; i <= number; i++) {
      sum += i;
    }
    return sum * sum;
  }
  int sumOfSquares(int number) {
    int sum = 0;
    for(int i=1; i <= number;i++){
      sum += i * i;
    }
    return sum;
  }
  int differenceOfSquares(int number) {
    return squareOfSum(number) - sumOfSquares(number);
  }
}
