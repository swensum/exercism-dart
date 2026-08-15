String reverse(String input) {
  String result = '';
  for (int i = input.length - 1; i >= 0; i--){// start from last position so input.length - 1,then looping until while i has not gone below 0. and i-- After every loop, move one position backwards.
    result += input[i];// adds each character to result.
  }
return result;
}
