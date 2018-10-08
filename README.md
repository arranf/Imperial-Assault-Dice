A library for simulating rolling dice in FFG's Imperial Assault.

## Usage

A simple usage example:

```dart
import 'package:imperial_assault_dice/imperial_assault_dice.dart';

main() {
  var calculator = new DiceCalculator([new RedDie(), new YellowDie()], [new BlackDie()]);

  var result = calculator.Simulate(30);
  print(result);
  
  var redDie = new RedDie();
  print(redDie.roll());
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/arranf/Imperial-Assault-Dice/issues
