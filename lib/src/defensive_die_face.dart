import 'package:imperial_assault_dice/src/die_face.dart';

class DefensiveDieFace extends DieFace {
  int surgeCancelled;
  int damageBlocked;
  bool isDodge;

  DefensiveDieFace(this.damageBlocked, this.surgeCancelled, [this.isDodge = false]);

  @override
  String toString() {
    if (isDodge) {
      return 'Missed';
    }
    return '$surgeCancelled surge cancel and $damageBlocked damage blocked';
  } 
}