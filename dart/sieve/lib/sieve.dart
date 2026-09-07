class Sieve {
  final int limit;

  Sieve(this.limit);
  List<int> get primes{
    if(limit < 2) {
      return [];
    }

    //true means then number is still considered prime.
    final isPrime = List<bool>.filled(limit + 1, true);

    //0 and 1 are not prime.
    isPrime[0] = false;
    isPrime[1] = false;

    for(var number = 2; number * number <= limit; number++){
      if(isPrime[number]){
        //Mark multiples of this prime as not prime.
        for(var multiple = number * number; multiple <= limit; multiple += number){
          isPrime[multiple] = false;
        }
      }
    }
    final result = <int> [];
    for(var number = 2; number <= limit; number++){
      if(isPrime[number]){
        result.add(number);
      }
    }
    return result;
  }
}
