bool isValid(String isbn) {
  //first checking validation
  isbn =
      isbn.replaceAll('-', ''); // replacing the dash or space from ISBN number
  if (isbn.length != 10) {
    // if the numbers are not 10 digit then its false
    return false;
  }
  int sum = 0; // initial summ is zero
  for (int i = 0; i < 10; i++) {
    // looping goes through all 10 value
    int value;
    if (i == 9 && isbn[i] == 'X') { //means it checking for last digit and its X so
      value = 10;
    } else {
      final parsed = int.tryParse(isbn[i]); // try to convert character into number

      if (parsed == null) {
        return false;
      }

      value = parsed;// defines valid number
    }

    sum += value * (10 - i);// formula about calcuating ISBN vale i mean digit * 10 where i start fom 0 
  }

  return sum % 11 == 0;// if the sum is divided by 11 and reminder == zero then its valid 
}





