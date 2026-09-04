class Pangram {
  bool isPangram(String sentence) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';

    final lowerSentence = sentence.toLowerCase();
    for (final letter in alphabet.split('')) {
      if (!lowerSentence.contains(letter)) {
        return false;
      }
    }
    return true;
  }
}
