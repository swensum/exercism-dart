class AllYourBase {
  List<int> rebase(int inputBase, List<int> digits, int outputBase){
    //Bases must be at least 2.
    if(inputBase < 2 || outputBase < 2) {
      throw ArgumentError();
    }

    //Every digit must be valid for the input base.
    for(final digit in digits){
      if(digit < 0 || digit >= inputBase){
        throw ArgumentError();
      }
    }

    //Convert input digits to decimal.
    var decimal = 0;

    for(final digit in digits){
      decimal = decimal * inputBase + digit;
    }

    //Zero is special.
    if(decimal == 0){
      return [0];
    }
    //Convert decimal to output base.
    final result = <int>[];

    while(decimal > 0){
      final remainder = decimal % outputBase;
      result.add(remainder);
      decimal ~/= outputBase;
    }
    //We generated the digits backwards.
    return result.reversed.toList();
  }
}
