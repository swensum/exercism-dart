class GradeSchool {
  final Map<int, List<String>> _students = {};

  List<bool> add(List<(String, int)> students) {
    final result = <bool>[];

    for (final (name, grade) in students) {
      // Check whether this student already exists
      // in any grade.
      var alreadyExists = false;

      for (final names in _students.values) {
        if (names.contains(name)) {
          alreadyExists = true;
          break;
        }
      }

      if (alreadyExists) {
        result.add(false);
        continue;
      }

      // Create the grade if it doesn't exist yet.
      _students.putIfAbsent(grade, () => []);

      _students[grade]!.add(name);

      result.add(true);
    }

    return result;
  }

  List<String> roster() {
    final result = <String>[];

    // Sort grades from smallest to largest.
    final grades = _students.keys.toList()..sort();

    for (final grade in grades) {
      final students = List<String>.from(_students[grade]!);

      // Sort students alphabetically.
      students.sort();

      result.addAll(students);
    }

    return result;
  }

  List<String> grade(int grade) {
    final students = _students[grade];

    if (students == null) {
      return [];
    }

    final result = List<String>.from(students);
    result.sort();

    return result;
  }
}