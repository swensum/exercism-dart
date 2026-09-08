class SpiralMatrix {
  final int size;

  SpiralMatrix(this.size);

  List<List<int>> toList() {
    if (size == 0) {
      return [];
    }

    final matrix = List.generate(
      size,
      (_) => List.filled(size, 0),
    );

    var number = 1;

    var top = 0;
    var bottom = size - 1;
    var left = 0;
    var right = size - 1;

    while (top <= bottom && left <= right) {
      // Move left → right across the top.
      for (var column = left; column <= right; column++) {
        matrix[top][column] = number++;
      }
      top++;

      // Move top → bottom down the right side.
      for (var row = top; row <= bottom; row++) {
        matrix[row][right] = number++;
      }
      right--;

      // Move right → left across the bottom.
      if (top <= bottom) {
        for (var column = right; column >= left; column--) {
          matrix[bottom][column] = number++;
        }
        bottom--;
      }

      // Move bottom → top up the left side.
      if (left <= right) {
        for (var row = bottom; row >= top; row--) {
          matrix[row][left] = number++;
        }
        left++;
      }
    }

    return matrix;
  }
}