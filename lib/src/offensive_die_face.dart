import 'package:imperial_assault_dice/src/die_face.dart';

class OffensiveDieFace extends DieFace {
  int surge;
  int damage;
  int range;

  OffensiveDieFace(this.surge, this.damage, [this.range = 0]);

  @override
  String toString() => '$surge surges, $damage damage, and $range range';
}