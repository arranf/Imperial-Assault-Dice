class RollResult {
  double damage;
  double surge;
  bool isMiss;

  RollResult(this.damage, this.surge, [this.isMiss = false]);
}