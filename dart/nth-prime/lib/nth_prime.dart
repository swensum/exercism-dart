class NthPrime {
  int prime(int n) {
    if (n == 0) {
      throw ArgumentError('There is no zeroth prime');
    }

    int count = 0;
    int number = 1;

    while (count < n) {
      number++;

      bool isPrime = true;

      for (int i = 2; i < number; i++) {
        if (number % i == 0) {
          isPrime = false;
          break;
        }
      }

      if (isPrime) {
        count++;
      }
    }

    return number;
  }
}





// class NthPrime {
//   int prime(int n) {
//     if (n == 0) {
//       throw ArgumentError("zero is not a prime");
//     }
//     int count = 0; // its for counting prime initilly its zeor
//     int number = 1; // start checking number from 1
//     while (count < n) {
//       //start looping until we gets count equal to n
//       number++; //increasing number to check
//       bool isPrime = true; //We initially assume number is prime
//       for (int i = 2; i < number; i++) {
//         //checking possible devisor start from i = 2 to less than number
//         if (number % i == 0) {
//           // while checking if divisible by i give zero then not a prime
//           isPrime = false;
//           break;
//         }
//       }
//       if (isPrime) {
//         count++;
//       }
//     }
//     return number;
//   }
// }
