import 'package:imperial_assault_dice/src/defensive_die.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';
import 'package:imperial_assault_dice/src/offensive_die.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';
import 'package:imperial_assault_dice/src/simulation_result.dart';

class DiceCalculator {
  final List<OffensiveDie> offensiveDice;
  final List<DefensiveDie> defensiveDice;

  DiceCalculator(this.offensiveDice, this.defensiveDice);
  
  SimulationResult Simulate([int simulationCount = 10000]) {
    List<_RollResult> simulations = new List();
    
    for (int i = 0; i < simulationCount; i++) {
      simulations.add(_CalculateEffectiveRoll());
    }

    double averageDamage = simulations.map((_RollResult r) => r.damage).fold(0, (int v, int n) => v + n) / simulationCount;
    double averageSurge = simulations.map((_RollResult r) => r.surge).fold(0, (int v, int n) => v + n) / simulationCount;
    double missLikelihood = simulations.where((_RollResult r) => r.isMiss).length / simulationCount;

    return new SimulationResult(simulationCount, averageDamage, averageSurge, missLikelihood);
  }

  _RollResult _CalculateEffectiveRoll() {
    var offensiveResult = _RollOffensiveDice();
    var defensiveResult = _RollDefensiveDice();
    
    int damage = offensiveResult.damage - defensiveResult.damageBlocked;
    damage = damage < 0 ? 0 : damage;

    int surges = offensiveResult.surge - defensiveResult.surgesCancelled;
    surges = surges < 0 ? 0 : surges;

    return new _RollResult(damage, surges, offensiveResult.range, defensiveResult.isMiss);
  }
  
  _DefensiveRoll _RollDefensiveDice() {
    int damageBlocked = 0, surgesCancelled = 0;
    bool isMiss = false;

    defensiveDice.forEach((DefensiveDie d) {
      DefensiveDieFace result = d.roll();
      damageBlocked += result.damageBlocked;
      surgesCancelled += result.damageBlocked;
      if (result.isDodge) {
        isMiss = true;
      }
    });

    return new _DefensiveRoll(damageBlocked, surgesCancelled, isMiss);
  }

  _RollResult _RollOffensiveDice() {
    int damage = 0, surges = 0, range = 0;

    offensiveDice.forEach((OffensiveDie d) {
      OffensiveDieFace result = d.roll();
      damage += result.damage;
      surges += result.surge;
      range += result.range;
    });

    return new _RollResult(damage, surges, range);
  }

  @override
  String toString() {
    String string = 'Calculator offensive dice: ';
    offensiveDice.forEach((OffensiveDie d) => string += d.name + ', ');
    string = string.substring(0, string.length - 2);

    if (defensiveDice != null && defensiveDice.length > 0) {
      string += '\nCalculator defensive dice: ';
      defensiveDice.forEach((DefensiveDie d) => string += d.name + ', ');
      string = string.substring(0, string.length - 2);
    }

    return string;
  }
}

class _DefensiveRoll {
    final int damageBlocked;
    final int surgesCancelled;
    final bool isMiss;

  _DefensiveRoll(this.damageBlocked, this.surgesCancelled, this.isMiss);
}

class _RollResult {
  final int damage;
  final int surge;
  final int range;
  final bool isMiss;

  _RollResult(this.damage, this.surge, this.range, [this.isMiss = false]);
}