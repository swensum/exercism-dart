BigInt square(final int n) {
 if (n<1 || n>64){
  throw ArgumentError('square must be between 1 and 64');
 }
  return BigInt.two.pow(n-1);
}

BigInt total() {
  BigInt sum = BigInt.zero;
  for (int i = 1; i <= 64; i++ ){
    sum += square(i);
  }
  return sum;
}
