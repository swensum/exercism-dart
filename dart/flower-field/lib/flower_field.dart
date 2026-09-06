class FlowerField {
  final List<String> garden;

  FlowerField(this.garden);

  List<String> get annotated {
    //No rows
    if (garden.isEmpty) {
      return [];
    }

    //Number of rows and columns
    final rows = garden.length;
    final columns = garden[0].length;

    //Create a mutable copy of the garden.
    final result = garden.map((row) => row.split('')).toList();

    //Check every position
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        //Flowers stay unchanged.
        if (garden[row][column] == '*') {
          continue;
        }

        var count = 0;

        //Check all 8 neighboring positions.
        for (var rowChange = -1; rowChange <= 1; rowChange++) {
          for (var columnChange = -1; columnChange <= 1; columnChange++) {
            //Don't check the current square itself.
            if (rowChange == 0 && columnChange == 0) {
              continue;
            }
            final newRow = row + rowChange;
            final newColumn = column + columnChange;

            //Make sure the neighbor is inside the garden.
            if (newRow >= 0 &&
                newRow < rows &&
                newColumn >= 0 &&
                newColumn < columns) {
              if (garden[newRow][newColumn] == '*') {
                count++;
              }
            }
          }
        }
        //If  there are flowers nearby, put the number.
        //Otherwise leave the space as it is.
        if (count > 0) {
          result[row][column] = count.toString();
        }
      }
    }
    //Convert each row back from List<String> to String.
    return result.map((row) => row.join()).toList();
  }
}
