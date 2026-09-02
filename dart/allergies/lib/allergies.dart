class Allergies {
  final Map<String, int> allergyScores = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128,
  };

  bool allergicTo(String item, int score) {
    final value = allergyScores[item];

    if (value == null) {
      return false;
    }

    return (score & value) != 0;
  }

  List<String> list(int score) {
    final result = <String>[];

    allergyScores.forEach((item, value) {
      if ((score & value) != 0) {
        result.add(item);
      }
    });

    return result;
  }
}