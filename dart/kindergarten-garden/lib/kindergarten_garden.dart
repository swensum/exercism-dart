enum Plant {
  grass,
  clover,
  radishes,
  violets,
}

enum Student {
  Alice,
  Bob,
  Charlie,
  David,
  Eve,
  Fred,
  Ginny,
  Harriet,
  Ileana,
  Joseph,
  Kincaid,
  Larry,
}

class KindergartenGarden {
  final String diagram;

  KindergartenGarden(this.diagram);

  List<Plant> plants(Student student) {
    final rows = diagram.split('\n');

    final studentIndex = student.index;
    final start = studentIndex * 2;

    final result = <Plant>[];

    // Two plants from the first row.
    result.add(_plantFromChar(rows[0][start]));
    result.add(_plantFromChar(rows[0][start + 1]));

    // Two plants from the second row.
    result.add(_plantFromChar(rows[1][start]));
    result.add(_plantFromChar(rows[1][start + 1]));

    return result;
  }

  Plant _plantFromChar(String plant) {
    switch (plant) {
      case 'G':
        return Plant.grass;
      case 'C':
        return Plant.clover;
      case 'R':
        return Plant.radishes;
      case 'V':
        return Plant.violets;
      default:
        throw ArgumentError('Unknown plant: $plant');
    }
  }
}