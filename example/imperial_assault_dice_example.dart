import 'package:imperial_assault_dice/imperial_assault_dice.dart';

main() {
  var dice = [new RedDie(), new GreenDie(), new BlueDie(), new YellowDie()];

  for (var die in dice) {
    print('$die');
  }
}
