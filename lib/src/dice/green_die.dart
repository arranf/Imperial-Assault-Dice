import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';

class GreenDie extends OffensiveDie {
  static List<OffensiveDieFace> _dieFaces = [
    new OffensiveDieFace(0, 2, 3),
    new OffensiveDieFace(0, 2, 2),
    new OffensiveDieFace(0, 2, 1),
    new OffensiveDieFace(1, 1, 2),
    new OffensiveDieFace(1, 1, 1),
    new OffensiveDieFace(1, 0, 1),
  ];

  GreenDie() : super(_dieFaces, 'Green Die');
}