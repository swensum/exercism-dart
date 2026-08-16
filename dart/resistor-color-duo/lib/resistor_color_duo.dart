class ResistorColorDuo {
  final List<String> colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ];
  int value (List <String> input){
   final first = colors.indexOf(input[0]);
   final second = colors.indexOf(input[1]);
   return first * 10 + second;
  }
  
}
