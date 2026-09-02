class Darts {
  int score(double x, double y) {
    final distanceSquared = x * x + y * y;

    if (distanceSquared <= 1) {
      return 10;
    }
    if (distanceSquared <= 25) {
      return 5;
    }
    if (distanceSquared <= 100) {
      return 1;
    }
    return 0;
  }
}
