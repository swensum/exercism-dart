class PascalsTriangle {
  List<List<int>> rows(int rowCount) {
    final result = <List<int>>[];

    if (rowCount == 0) {
      return result;
    }

    result.add([1]);

    for (int i = 1; i < rowCount; i++) {
      final previousRow = result[i - 1];
      final currentRow = <int>[1];

      for (int j = 0; j < previousRow.length - 1; j++) {
        currentRow.add(previousRow[j] + previousRow[j + 1]);
      }

      currentRow.add(1);

      result.add(currentRow);
    }

    return result;
  }
}