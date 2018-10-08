
import 'package:imperial_assault_dice/src/die.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';

abstract class DefensiveDie extends Die {
  @override
  final List<DefensiveDieFace> dieFaces;

  DefensiveDie(this.dieFaces, String name) : super(name);

  double AverageDamageBlocked() => this.dieFaces.fold(0, (int value, DefensiveDieFace f) => value + f.damageBlocked) / this.dieFaces.length;
  double AverageSurgeCancelled () => this.dieFaces.fold(0, (int value, DefensiveDieFace f ) => value + f.surgeCancelled) / this.dieFaces.length;
  double ChanceOfDodge () => this.dieFaces.fold(0, (int value, DefensiveDieFace f) => value + (f.isDodge ? 1 : 0)) / this.dieFaces.length;

  @override
  String toString() => '${name}: Average Damage Blocked: ${AverageDamageBlocked()}, Average Surge Cancelled: ${AverageSurgeCancelled()}, Chance of Dodge: ${ChanceOfDodge()}';
}