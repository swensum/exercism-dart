class Etl {
  Map<String, int> transform(Map<String, List<String>> old){
    final Map<String,int>result = {};
    old.forEach((score, letters)
    {
      final int value =int.parse(score);
      for (final letter in letters) {
        result[letter.toLowerCase()] =value;
      }
    });
    return result;
  }
}
