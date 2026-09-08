import 'dart:math';

class DndCharacter {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int hitpoints;
  DndCharacter({
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
  }) : hitpoints = 10 + modifier(constitution);
  static int modifier(int score) {
    return ((score - 10) / 2).floor();
  }

  static int ability() {
    final random = Random();
    final dice = List.generate(4, (_) => random.nextInt(6) + 1);
    dice.sort();
    return dice[1] + dice[2] + dice[3];
  }

  static DndCharacter create() {
    return DndCharacter(
      strength: ability(),
      dexterity: ability(),
      constitution: ability(),
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
    );
  }
}
