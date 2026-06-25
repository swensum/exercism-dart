class House {
 static const List<String> _subjects = [
  'the house',
  'the malt',
  'the rat',
  'the cat',
  'the dog',
  'the cow with the crumpled horn',
  'the maiden all forlorn',
    'the man all tattered and torn',
    'the priest all shaven and shorn',
    'the rooster that crowed in the morn',
    'the farmer sowing his corn',
    'the horse and the hound and the horn',
 ];
 static const List<String> _actions = [
  'that Jack built.',
    'that lay in the house',
    'that ate the malt',
    'that killed the rat',
    'that worried the cat',
    'that tossed the dog',
    'that milked the cow with the crumpled horn',
    'that kissed the maiden all forlorn',
    'that married the man all tattered and torn',
    'that woke the priest all shaven and shorn',
    'that kept the rooster that crowed in the morn',
    'that belonged to the farmer sowing his corn',
 ];
 String recite(int startVerse, int endVerse){
  final verses = <String>[];
   for (int verse = startVerse; verse <= endVerse; verse++){
    verses.add(_buildVerse(verse));
   }
   return  verses.join('\n');
 }
 String _buildVerse(int verse) {
  final parts = <String> [];
  parts.add('This is ${_subjects[verse -1]}');

  for (int i = verse - 1; i > 0; i--) {
    parts.add(_actions[i]);
  }
  parts.add(_actions[0]);
  return parts.join(' ');
 }
}
