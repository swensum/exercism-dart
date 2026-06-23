int score(String word) {
  int totalScore = 0;

  for (var letter in word.toUpperCase().split('')) {
    if ('AEIOULNRST'.contains(letter)) {
      totalScore += 1;
    } else if ('DG'.contains(letter)) {
      totalScore += 2;
    } else if ('BCMP'.contains(letter)) {
      totalScore += 3;
    } else if ('FHVWY'.contains(letter)) {
      totalScore += 4;
    } else if ('K'.contains(letter)) {
      totalScore += 5;
    } else if ('JX'.contains(letter)) {
      totalScore += 8;
    } else if ('QZ'.contains(letter)) {
      totalScore += 10;
    }
  }

  return totalScore;
}