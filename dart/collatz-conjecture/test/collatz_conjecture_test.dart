import 'package:collatz_conjecture/collatz_conjecture.dart';
import 'package:test/test.dart';

void main() {
  final collatzConjecture = CollatzConjecture();
  final onlyPositive = predicate(
      (ArgumentError e) => e.message == 'Only positive integers are allowed',
      'an ArgumentError with the message "Only positive integers are allowed"');

  group('CollatzConjecture', () {
    test('zero steps for one', () {
      final result = collatzConjecture.steps(1);
      expect(result, equals(0));
    }, skip: false);

    test('divide if even', () {
      final result = collatzConjecture.steps(16);
      expect(result, equals(4));
    }, skip: true);

    test('even and odd steps', () {
      final result = collatzConjecture.steps(12);
      expect(result, equals(9));
    }, skip: true);

    test('large number of even and odd steps', () {
      final result = collatzConjecture.steps(1000000);
      expect(result, equals(152));
    }, skip: true);

    test('zero is an error', () {
      expect(() => collatzConjecture.steps(0), throwsA(onlyPositive));
    }, skip: true);

    test('negative value is an error', () {
      expect(() => collatzConjecture.steps(-15), throwsA(onlyPositive));
    }, skip: true);
  });
}
