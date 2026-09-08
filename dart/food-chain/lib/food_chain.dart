class FoodChain {
  List<String> recite(int startVerse, int endVerse) {
    final result = <String>[];

    for (var verse = startVerse; verse <= endVerse; verse++) {
      result.addAll(_verse(verse));

      if (verse != endVerse) {
        result.add('');
      }
    }

    return result;
  }

  List<String> _verse(int verse) {
    final animals = [
      'fly',
      'spider',
      'bird',
      'cat',
      'dog',
      'goat',
      'cow',
      'horse',
    ];

    final result = <String>[];
    final animal = animals[verse - 1];

    result.add('I know an old lady who swallowed a $animal.');

    if (animal == 'horse') {
      result.add("She's dead, of course!");
      return result;
    }

    if (animal != 'fly') {
      result.add(_specialLine(animal));

      for (var i = verse - 1; i >= 1; i--) {
        final current = animals[i];
        final next = animals[i - 1];

        if (current == 'spider') {
          result.add(
            'She swallowed the spider to catch the fly.',
          );
        } else if (current == 'bird') {
          result.add(
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.',
          );
        } else {
          result.add(
            'She swallowed the $current to catch the $next.',
          );
        }
      }
    }

    result.add(
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    );

    return result;
  }

  String _specialLine(String animal) {
    switch (animal) {
      case 'spider':
        return 'It wriggled and jiggled and tickled inside her.';
      case 'bird':
        return 'How absurd to swallow a bird!';
      case 'cat':
        return 'Imagine that, to swallow a cat!';
      case 'dog':
        return 'What a hog, to swallow a dog!';
      case 'goat':
        return 'Just opened her throat and swallowed a goat!';
      case 'cow':
        return "I don't know how she swallowed a cow!";
      default:
        return '';
    }
  }
}