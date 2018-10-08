import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';

class RedDie extends OffensiveDie {
  static List<OffensiveDieFace> _dieFaces = [
    new OffensiveDieFace(0, 3),
    new OffensiveDieFace(0, 3),
    new OffensiveDieFace(0, 2),
    new OffensiveDieFace(0, 2),
    new OffensiveDieFace(1, 2),
    new OffensiveDieFace(0, 1),
  ];
  RedDie() : super(_dieFaces, 'Red Die');
}