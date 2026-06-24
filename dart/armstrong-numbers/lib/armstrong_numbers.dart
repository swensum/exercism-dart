class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    final digits = number.split('');
    final power = digits.length;

    BigInt sum = BigInt.zero;

    for (final digit in digits) {
      final int d = int.parse(digit);
      sum += _power(BigInt.from(d), power);
    }

    return sum == BigInt.parse(number);
  }
  BigInt _power(BigInt base, int exp){
    BigInt result = BigInt.one;
    for(int i = 0; i< exp; i++){
      result *= base;
    }
    return result;
  }
}