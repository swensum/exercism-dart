class SecretHandshake {
  List<String> commands(int number){
    final actions = <String>[];
    if (number & 1 != 0){
      actions.add('wink');
    }
    if (number & 2 !=0){
      actions.add('double blink');
    }
    if (number & 4 !=0){
      actions.add('close your eyes');
    }
    if (number & 8 !=0){
      actions.add('jump');
    }
    if (number & 16 !=0){
      return actions.reversed.toList();
    }
    return actions;
    
  }
}
