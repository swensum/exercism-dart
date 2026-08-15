class CollatzConjecture {
   int steps(int number){// function recieves number to check is = 1
    if(number <= 0){
      throw ArgumentError('Only positive integers are allowed');
    }
    int count = 0;// tracking the count number , intially its zero
   while(number != 1){// looping the number until its equal to 1 
   if (number % 2 == 0){// checking even number
    number = number ~/ 2; // if even then divie by 2 
   } else{
    number = number * 3 + 1;// if odd then multiply by 3  plus 1
   }
   count++;//do loop until gets 1 
   } 
   return count;
   }
}
