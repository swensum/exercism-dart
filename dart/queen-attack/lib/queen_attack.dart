
class Queen {
  final int row;
  final int column;

  Queen(this.row, this.column) {
    assert(row >= 0, 'row not positive');
    assert(row < 8, 'row not on board');

    assert(column >= 0, 'column not positive');
    assert(column < 8, 'column not on board');
  }

  bool canAttack(Queen other) {
    if (row == other.row) {
      return true;
    }

    if (column == other.column) {
      return true;
    }

    if ((row - other.row).abs() == (column - other.column).abs()) {
      return true;
    }

    return false;
  }
}
