class ZebraPuzzle {
  String drinksWater = '';
  String ownsZebra = '';

  void solve() {
    final houses = [0, 1, 2, 3, 4];

   

    for (final colors in _permutations(houses)) {
      // Green house is immediately to the right of ivory house.
      if (colors[1] != colors[2] + 1) {
        continue;
      }

      for (final nationalities in _permutations(houses)) {
        // Englishman lives in the red house.
        if (nationalities[0] != colors[0]) {
          continue;
        }

        // Norwegian lives in the first house.
        if (nationalities[3] != 0) {
          continue;
        }

        // Norwegian lives next to the blue house.
        if (!_nextTo(nationalities[3], colors[4])) {
          continue;
        }

        for (final drinks in _permutations(houses)) {
          // Green house drinks coffee.
          if (drinks[0] != colors[1]) {
            continue;
          }

          // Ukrainian drinks tea.
          if (drinks[1] != nationalities[2]) {
            continue;
          }

          // Middle house drinks milk.
          if (drinks[2] != 2) {
            continue;
          }

          for (final pets in _permutations(houses)) {
            // Spaniard owns the dog.
            if (pets[0] != nationalities[1]) {
              continue;
            }

            for (final hobbies in _permutations(houses)) {
              // Snail owner likes dancing.
              if (hobbies[0] != pets[1]) {
                continue;
              }

              // Yellow house is occupied by a painter.
              if (hobbies[1] != colors[3]) {
                continue;
              }

              // Reader lives next to fox owner.
              if (!_nextTo(hobbies[2], pets[2])) {
                continue;
              }

              // Painter lives next to horse owner.
              if (!_nextTo(hobbies[1], pets[3])) {
                continue;
              }

              // Football player drinks orange juice.
              if (hobbies[3] != drinks[3]) {
                continue;
              }

              // Japanese person plays chess.
              if (hobbies[4] != nationalities[4]) {
                continue;
              }

              // All constraints are satisfied.
              final waterHouse = drinks[4];
              final zebraHouse = pets[4];

              drinksWater = _nationalityAtHouse(
                nationalities,
                waterHouse,
              );

              ownsZebra = _nationalityAtHouse(
                nationalities,
                zebraHouse,
              );

              return;
            }
          }
        }
      }
    }
  }

  String _nationalityAtHouse(
    List<int> nationalities,
    int house,
  ) {
    const names = [
      'Englishman',
      'Spaniard',
      'Ukrainian',
      'Norwegian',
      'Japanese',
    ];

    for (var i = 0; i < nationalities.length; i++) {
      if (nationalities[i] == house) {
        return names[i];
      }
    }

    return '';
  }

  bool _nextTo(int first, int second) {
    return (first - second).abs() == 1;
  }

  List<List<int>> _permutations(List<int> list) {
    if (list.length == 1) {
      return [List.from(list)];
    }

    final result = <List<int>>[];

    for (var i = 0; i < list.length; i++) {
      final current = list[i];

      final remaining = List<int>.from(list)
        ..removeAt(i);

      for (final permutation in _permutations(remaining)) {
        result.add([
          current,
          ...permutation,
        ]);
      }
    }

    return result;
  }
}