class SquareRoot {
  int squareRoot(int number) {
    var guess = 1 ;
    while (guess * guess != number) {
      guess++;
    }
    return guess;
  }
}
