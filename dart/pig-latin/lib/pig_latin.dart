String translate(String input){
  final words = input.split(' ');
  return words.map(_translateWord).join(' ');
}

String _translateWord(String word) {
  //Rule 1
  if(_isVowel(word[0]) || word.startsWith('xr') || word.startsWith('yt')){
    return '${word}ay';
  }
  //Look for the point where we should split the word.
  for(var i = 0; i < word.length; i++){
    //Rule 3 : qu moves together
    if(word.substring(i).startsWith('qu')){
      return '${word.substring(i + 2)}${word.substring(0, i + 2)}ay';
    }
    //Rule 4: y acts as a vowel after consonents
    if(word[i] == 'y' && i > 0){
      return '${word.substring(i)}${word.substring(0, i)}ay';
    }

    //Normal vowel
    if(_isVowel(word[i])){
      return '${word.substring(i)}${word.substring(0, i)}ay';
    }
  }
  return '${word}ay';
}
bool _isVowel(String letter){
  return 'aeiou'.contains(letter);
}