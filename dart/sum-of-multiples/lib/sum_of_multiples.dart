class SumOfMultiples {
  int sum(List<int> factors, int limit){ // receives factor given in question eg 3, 5 and limit 20
   final multiples = <int>{};   // using set to avoid duplicates
   for (final factor in factors){ //looping for each factor
    if (factor == 0){ // if factor is 0, we skip it to avoid infinite loop
      continue; //next iteration of the loop
    }
    for(var multiple = factor; multiple < limit ; multiple += factor){ //looping through multiples of the factor until it reaches the limit and its continue until all factors are processed
      multiples.add(multiple); //adding the multiple to the set
    }
   }
   var total = 0; //initializing total to 0
   for (final multiple in multiples){ //looping through the set of multiples that store all the multiples of the factors
    total += multiple; //adding each multiple to the total
   

   }
   return total; //returning the total sum of multiples
  }
}
