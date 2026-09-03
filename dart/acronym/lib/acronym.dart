class Acronym {
  String abbreviate(String phrase) {
    //Hyphens areword seperators.
    phrase = phrase.replaceAll('-', ' ');
    //Remove  punctuation
    phrase = phrase.replaceAll(RegExp(r'[^\w\s]'), '');
    //Underscore is punctuation in this exercise .
    phrase = phrase.replaceAll('_', '');

    //Split into words, allowing multiple spaces.
    final words = phrase.split(RegExp(r'\s+'));

    String result = '';
    for (final word in words) {
      if (word.isNotEmpty) {
        result += word[0];
      }
    }
    return result.toUpperCase();
  }
}
