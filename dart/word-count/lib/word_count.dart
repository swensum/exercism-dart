class WordCount {
  Map <String, int>countWords(String subtitle){
    final words = RegExp(r"[a-zA-Z0-9]+(?:'[a-zA-Z0-9]+)*").allMatches(subtitle.toLowerCase()).map((match) => match.group(0)!);
    final result = <String, int>{};
    for(final word in words) {
      result[word] = (result[word] ?? 0) + 1;
    }
    return result;
  }
}
