class EggCounter {
 int count(int number){
  int eggs = 0;
  while(number > 0) {
    eggs += number % 2;
    number ~/= 2;
  }
  return eggs;
 }
}
