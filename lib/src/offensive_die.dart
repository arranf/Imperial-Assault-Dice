import 'package:imperial_assault_dice/src/die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';

abstract class OffensiveDie extends Die {
  @override
  List<OffensiveDieFace> dieFaces;

  OffensiveDie(this.dieFaces) : super(null);

  double AverageDamage() => this.dieFaces.fold(0.0, (double v, OffensiveDieFace f) => v + f.damage) / this.dieFaces.length;
  double AverageSurge () => this.dieFaces.fold(0.0, (double v, OffensiveDieFace f) => v + f.surge) / this.dieFaces.length;
  double AverageRange () => this.dieFaces.fold(0.0, (double v, OffensiveDieFace f) => v + f.range) / this.dieFaces.length;

  @override
  String toString() => 'Average Damage: ${AverageDamage()}, Average Surge: ${AverageSurge()}, Average Range: ${AverageRange()}';
}