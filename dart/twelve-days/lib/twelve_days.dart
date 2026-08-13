class TwelveDays {
  String recite(int start, int end) {  //from first to last day)
    final days = [
      'first',
      'second',
      'third',
      'fourth',
      'fifth',
      'sixth',
      'seventh',
      'eighth',
      'ninth',
      'tenth',
      'eleventh',
      'twelfth',
    ];

    final gifts = [
      'a Partridge in a Pear Tree.',
      'two Turtle Doves,',
      'three French Hens,',
      'four Calling Birds,',
      'five Gold Rings,',
      'six Geese-a-Laying,',
      'seven Swans-a-Swimming,',
      'eight Maids-a-Milking,',
      'nine Ladies Dancing,',
      'ten Lords-a-Leaping,',
      'eleven Pipers Piping,',
      'twelve Drummers Drumming,',
    ];

    final verses = <String>[]; // empty list to hold the verses

    for (var day = start; day <= end; day++) {//Start at start, keep going until end, and increase day by 1 each time.
      var verse =
          'On the ${days[day - 1]} day of Christmas my true love gave to me:'; // here loops start with 0 so day = 1 so days (1-1) = days[0]= first.

      for (var gift = day - 1; gift >= 0; gift--) { //here verses are reverse so on third verse it shows second and first gifts so gift = day-1, and gift>= 0 means stop at 0 and gift -- is reverse.
        if (gift == 0 && day > 1) {   //we need to add and only when: we are adding the final gift AND it isn't the first day
          verse += ' and ${gifts[gift]}'; //add and to the final gift
        } else {
          verse += ' ${gifts[gift]}';
        }
      }

      verses.add(verse);
    }

    return verses.join('\n');
  }
}
