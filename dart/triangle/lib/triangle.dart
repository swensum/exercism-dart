class Triangle {
  bool _isValidTriangle(num a, num b, num c) {
    //Every side must be greater than 0.
    if (a <= 0 || b <= 0 || c <= 0) {
      return false;
    }
    // Triangle inequality.
    if (a + b < c) {
      return false;
    }
    if (a + c < b) {
      return false;
    }
    if (b + c < a) {
      return false;
    }
    return true;
  }

  bool equilateral(num a, num b, num c) {
    if (!_isValidTriangle(a, b, c)) {
      return false;
    }
    return a == b && b == c;
  }

  bool isosceles(num a, num b, num c) {
    if (!_isValidTriangle(a, b, c)) {
      return false;
    }
    return a == b || a == c || b == c;
  }

  bool scalene(num a, num b, num c) {
    if (!_isValidTriangle(a, b, c)) {
      return false;
    }
    return a != b && a != c && b != c;
  }
}
