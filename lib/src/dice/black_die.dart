
import 'package:imperial_assault_dice/src/defensive_die.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';

class BlackDie extends DefensiveDie {
  static List<DefensiveDieFace> _dieFaces = [
    new DefensiveDieFace(0, 1),
    new DefensiveDieFace(1, 0),
    new DefensiveDieFace(1, 0),
    new DefensiveDieFace(2, 0),
    new DefensiveDieFace(2, 0),
    new DefensiveDieFace(3, 0),
  ];
  BlackDie() : super(_dieFaces);

  @override
  String toString() => 'Black Die Die: ${super.toString()}';
}