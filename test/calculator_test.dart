import 'package:imperial_assault_dice/imperial_assault_dice.dart';
import 'package:imperial_assault_dice/src/defensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:test/test.dart';

void main() {
  DiceCalculator calculator;
  test('Result damage can never be negative', () {
    // Weakest dice against many black dice
    List<DefensiveDie> defensiveDice = [];
    for (int i = 0; i < 999; i++) {defensiveDice.add(new BlackDie());} 
    calculator = new DiceCalculator([new YellowDie()], defensiveDice);
    var result = calculator.Simulate();
    expect(result.averageDamage, isNonNegative);
  });

  test('Result surges can never be negative', () {
    // Weakest dice against many white dice which cancel surges
    List<DefensiveDie> defensiveDice = [];
    for (int i = 0; i < 999; i++) {defensiveDice.add(new WhiteDie());}
    calculator = new DiceCalculator([new RedDie()], defensiveDice);
    var result = calculator.Simulate();
    expect(result.averageSurge, isNonNegative);
  });

  test('Miss likelihood is 0 without white dice', () {
    calculator = new DiceCalculator([new YellowDie()], [new BlackDie()]);
    var result = calculator.Simulate();
    expect(result.missLikelihood, isZero);
  });

  test('Average damage is large with many offensive dice', () {
    List<OffensiveDie> offensiveDice = [];
    for (int i = 0; i < 999; i++) {offensiveDice.add(new RedDie());}
    calculator = new DiceCalculator(offensiveDice, [new BlackDie()]);
    var result = calculator.Simulate();
    expect(result.averageDamage, greaterThanOrEqualTo(750));
  });

  test('Average surge is large with many offensive dice', () {
    List<OffensiveDie> offensiveDice = [];
    for (int i = 0; i < 999; i++) {offensiveDice.add(new YellowDie());}
    calculator = new DiceCalculator(offensiveDice, [new BlackDie()]);
    var result = calculator.Simulate();
    expect(result.averageDamage, greaterThanOrEqualTo(750));
  });
  
  test('Simulate does not require defensive dice', () {
    calculator = new DiceCalculator([new RedDie(), new YellowDie()]);
    var function = calculator.Simulate();
    expect(function, new TypeMatcher<SimulationResult>());
  });
}