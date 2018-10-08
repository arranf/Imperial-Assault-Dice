import 'package:imperial_assault_dice/imperial_assault_dice.dart';

main() {
  var dice = [new RedDie(), new YellowDie()];
  var defensiveDice = [new WhiteDie()];

  for (var die in dice) {
    print('${die.roll()}');
  }

  var calculator = new DiceCalculator(dice, defensiveDice);
  print(calculator);

  var result = calculator.Simulate();
  print(result);
}
