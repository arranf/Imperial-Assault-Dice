import 'dart:math';

import 'package:imperial_assault_dice/src/die_face.dart';

abstract class Die {
  final List<DieFace> dieFaces;
  final String name;
  
  Die(this.name);

  DieFace roll() {
    var random = new Random();
    var index = random.nextInt(this.dieFaces.length);
    return this.dieFaces.elementAt(index);
  }
}