class GameOfLife {
  List<List<int>> _board;

  GameOfLife(this._board);

  List<List<int>> matrix() {
    return _board;
  }

  void tick() {
    if (_board.isEmpty) return;

    final rows = _board.length;
    final cols = _board[0].length;

    final next = List.generate(
      rows,
      (_) => List.filled(cols, 0),
    );

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final neighbors = _countNeighbors(r, c);

        if (_board[r][c] == 1) {
          if (neighbors == 2 || neighbors == 3) {
            next[r][c] = 1;
          }
        } else {
          if (neighbors == 3) {
            next[r][c] = 1;
          }
        }
      }
    }

    _board = next;
  }

  int _countNeighbors(int row, int col) {
    int count = 0;

    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;

        final nr = row + dr;
        final nc = col + dc;

        if (nr >= 0 &&
            nr < _board.length &&
            nc >= 0 &&
            nc < _board[0].length) {
          count += _board[nr][nc];
        }
      }
    }

    return count;
  }
}