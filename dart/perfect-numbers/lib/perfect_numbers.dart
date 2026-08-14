enum Classification {
  perfect,
  abundant,
  deficient,
}

class PerfectNumbers {
  Classification classify(int number) {
    // Validate the input number
    if (number <= 0) {
      // If the number is less than or equal to 0, throw an ArgumentError
      throw ArgumentError();
    }
    int sum = 0; //initial sum is zero
    for (int i = 1; i < number; i++) {
      // it means factor must be less than given number
      if (number % i == 0) {
        // means if number is divide by i and reminder is 0  the its a factor
        sum += i; // add the factor number
      }
    }
    if (sum == number) {
      return Classification.perfect;
    } else if (sum > number) {
      return Classification.abundant;
    } else {
      return Classification.deficient;
    }
  }
}
