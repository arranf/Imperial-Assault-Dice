import 'package:imperial_assault_dice/src/die_face.dart';

class DefensiveDieFace extends DieFace {
  int surgeCancel;
  int damageBlocked;
  bool isMiss;

  DefensiveDieFace(this.damageBlocked, this.surgeCancel, [this.isMiss = false]);

  @override
  String toString() {
    if (isMiss) {
      return 'Missed';
    }
    return '$surgeCancel surge cancel and $damageBlocked damage blocked';
  } 
}