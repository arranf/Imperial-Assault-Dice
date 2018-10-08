import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';

class BlueDie extends OffensiveDie {
  static List<OffensiveDieFace> _dieFaces = [
    new OffensiveDieFace(0, 2, 3),
    new OffensiveDieFace(0, 1, 5),
    new OffensiveDieFace(0, 1, 2),
    new OffensiveDieFace(1, 0, 2),
    new OffensiveDieFace(1, 1, 3),
    new OffensiveDieFace(0, 2, 4),
  ];
  BlueDie() : super(_dieFaces, 'Blue Die');
}