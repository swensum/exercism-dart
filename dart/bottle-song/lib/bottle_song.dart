class BottleSong {
  List<String> recite(int start, int take) {// means start and take means how many verse it takes
    final numbers = [
      'no',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
    ];

    final result = <String>[];// empty list container

    for (int i = 0; i < take; i++) {// looping o given verse takrs i mean if take = 3 then i = 0, 1, 2
      final current = start - i;// gets the current number of bottles means if take is 3 and start is 10 then current = 10, 9, 8(10-0,10-1,10-2)
      final next = current - 1;//Gets the number after one bottle falls means (9,8,7)

      final currentWord =
          numbers[current][0].toUpperCase() + numbers[current].substring(1);// changing first number text into upperletter

      final nextWord = numbers[next];//Gets the next number.

      final bottleWord = current == 1 ? 'bottle' : 'bottles';//This is a ternary operator. It means: If current is 1, use "bottle", otherwise use "bottles".
      final nextBottleWord = next == 1 ? 'bottle' : 'bottles';// same thing

      result.add('$currentWord green $bottleWord hanging on the wall,');
      result.add('$currentWord green $bottleWord hanging on the wall,');
      result.add('And if one green bottle should accidentally fall,');
      result.add(
        "There'll be $nextWord green $nextBottleWord hanging on the wall.",
      );

      if (i < take - 1) {//The tests require an empty line between verses.
        result.add('');
      }
    }

    return result;
  }
}