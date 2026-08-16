class Isogram {
  bool isIsogram(String phrase) {
    //functio receiving phrase
    final seen = <String>{}; //empty container
    for (final character in phrase.toLowerCase().split('')) {
      //convert letter to lowercase and split it  and loop for each character.
      if (character == '' || character == '-') {
        //ignore space and dash
        continue;
      }
      if (seen.contains(character)) {
        //if contains double letter then its not a isogram
        return false;
      }
      seen.add(character); //add a isogram letters in container
    }
    return true;
  }
}
