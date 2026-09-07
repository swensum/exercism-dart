

import 'categories.dart';

class Yacht {
  final List<int> dice;
  Yacht(this.dice);

  int score(Category category){
    switch(category){
      case Category.ones:
       return _numberScore(1);

      case Category.twos:
       return _numberScore(2);

      case Category.threes:
       return _numberScore(3);

      case Category.fours:
       return _numberScore(4);

      case Category.fives:
       return _numberScore(5);

      case Category.sixes:
       return _numberScore(6);

      case Category.full_house:
       return _isFullHouse() ? _sum() : 0;

      case Category.four_of_a_kind:
       return _fourOfAKind();

      case Category.little_straight:
        return _isLittleStraight() ? 30 : 0;

      case Category.big_straight:
      return _isBigStraight() ? 30 : 0;

      case Category.choice:
       return _sum();

      case Category.yacht:
        return _isYacht() ? 50 : 0;           
    }
  }
  int _numberScore(int number){
    var total = 0;
    for(final die in dice){
  if(die == number) {
    total += number;
  }
    }
    return total;
  }
  int _sum(){
    var total = 0;

    for( final die in dice) {
      total += die;
    }
    return total;
  }

  bool _isYacht() {
    for(final die in dice){
  if(die != dice[0]){
    return false;
  }

    }
    return true;
  }
  bool _isFullHouse() {
    final counts = <int, int>{};

    for(final die in dice){
      counts[die] = (counts[die] ?? 0) + 1;
    }
    return counts.length == 2 && (counts.values.contains(2) && counts.values.contains(3));
  }
  int _fourOfAKind(){
    final counts = <int, int>{};

    for(final die in dice){
      counts[die] = (counts[die] ?? 0) + 1;
    }
    for(final entry in counts.entries){
     if (entry.value >= 4){
      return entry.key * 4;
     }
    }
    return 0;
  }
  bool _isLittleStraight(){
    return _hasExactlyOneOfEach([1,2,3,4,5]);
  }
  bool _isBigStraight(){
    return _hasExactlyOneOfEach([2,3,4,5,6]);
  }
  bool _hasExactlyOneOfEach(List<int>numbers){
    for(final number in numbers){
      var found = false;

      for(final die in dice){
        if(die == number){
          if(found) {
            return false;
          }
          found = true;
        }
      }
      if (!found){
        return false;
      }
    }
    return true;
  }
}
