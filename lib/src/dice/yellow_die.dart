import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';

class YellowDie extends OffensiveDie {
  static List<OffensiveDieFace> _dieFaces = [
    new OffensiveDieFace(1, 1, 1),
    new OffensiveDieFace(2, 0, 1),
    new OffensiveDieFace(2, 1),
    new OffensiveDieFace(0, 1, 2),
    new OffensiveDieFace(1, 0, 2),
    new OffensiveDieFace(1, 0),
  ];
  YellowDie() : super(_dieFaces);

  @override
  String toString() => 'Yellow Die: ${super.toString()}';
}