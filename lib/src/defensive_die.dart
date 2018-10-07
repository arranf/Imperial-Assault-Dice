
import 'package:imperial_assault_dice/src/die.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';

abstract class DefensiveDie extends Die {
  final List<DefensiveDieFace> dieFaces;

  DefensiveDie(this.dieFaces) : super(null);
  double AverageDamageBlocked() => this.dieFaces.fold(0.0, (double value, DefensiveDieFace f) => value + f.damageBlocked) / this.dieFaces.length;
  double AverageSurgeCancelled () => this.dieFaces.fold(0.0, (double value, DefensiveDieFace f ) => value + f.surgeCancel) / this.dieFaces.length;
  double ChanceOfMiss = 1/6;
}