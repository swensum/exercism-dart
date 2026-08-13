class Anagram {
  List<String> findAnagrams(String target, List<String> candidates) {
    // receives a target word and list of candidates
    final result = <String>[]; // empty list to store the anagrams
    final targetLower = target.toLowerCase(); // convert target to lowercase
    final targetSorted = targetLower.split('')
      ..sort(); // sort the letters of the target word and ut in split format
    for (final candidate in candidates) {
      final candidateLower = candidate.toLowerCase();
      if (candidateLower == targetLower) {
        continue;
      }
      final candidateSorted = candidateLower.split('')..sort();
      if (candidateSorted.toString() == targetSorted.toString()) {
        result.add(candidate);
      }
    }
    return result;
  }
}
