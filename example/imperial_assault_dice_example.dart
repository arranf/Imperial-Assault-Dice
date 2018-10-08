import 'package:imperial_assault_dice/imperial_assault_dice.dart';

main() {
  var dice = [new RedDie(), new YellowDie(), new GreenDie()];
  var defensiveDice = [new WhiteDie()];

  var calculator = new DiceCalculator(dice, defensiveDice);

  var result = calculator.Simulate(100000);
  print(result);
}
