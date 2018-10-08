
import 'package:imperial_assault_dice/src/defensive_die.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';

class WhiteDie extends DefensiveDie {
  static List<DefensiveDieFace> _dieFaces = [
    new DefensiveDieFace(0, 0, true),
    new DefensiveDieFace(0, 0),
    new DefensiveDieFace(0, 1),
    new DefensiveDieFace(1, 1),
    new DefensiveDieFace(1, 1),
    new DefensiveDieFace(1, 0),
  ];
  WhiteDie() : super(_dieFaces, 'White Die');
}