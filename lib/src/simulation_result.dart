class SimulationResult {
  final double averageDamage;
  final double averageSurge;
  final double missLikelihood;
  final int numberOfTrials;

  SimulationResult(this.numberOfTrials, this.averageDamage, this.averageSurge, this.missLikelihood);

  @override
  String toString() => 'After ${numberOfTrials} trials. Average damage: ${averageDamage.toStringAsFixed(2)}, average surge ${averageSurge.toStringAsFixed(2)}, miss likelihood ${(missLikelihood * 100).toStringAsFixed(2)}%';
}