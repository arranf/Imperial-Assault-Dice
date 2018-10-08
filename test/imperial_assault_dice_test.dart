import 'package:imperial_assault_dice/imperial_assault_dice.dart';
import 'package:imperial_assault_dice/src/defensive_die_face.dart';
import 'package:imperial_assault_dice/src/offensive_die_face.dart';


import 'package:test/test.dart';

void main() {

  Matcher damage(m) => new _Damage(wrapMatcher(m));
  Matcher range(m) => new _Range(wrapMatcher(m));
  Matcher surge(m) => new _Surge(wrapMatcher(m));
  Matcher damageBlocked(m) => new _DamageBlocked(wrapMatcher(m));
  Matcher surgeCancelled(m) => new _SurgeCancelled(wrapMatcher(m));
  const int ROLL_AMOUNT = 1000;

  group('Red Die Tests', () {
    RedDie redDie = new RedDie();
    List<OffensiveDieFace> rolls = [];
    for (int i = 0; i < ROLL_AMOUNT; i++) {
      rolls.add(redDie.roll());
    }

    test('Average Damage = 13/6', () => expect(redDie.AverageDamage(), equals(13/6)));

    test('Average Range = 0', () => expect(redDie.AverageRange(), equals(0)));
    test('Average Surge = 1/6', () => expect(redDie.AverageSurge(), equals(1/6)));
    test('Name Correct', () => expect(redDie.name, equals('Red Die')));
    test('Faces Correct Type', () => expect(redDie.dieFaces, everyElement(new TypeMatcher<OffensiveDieFace>())));
    test('ToString() Contains Die Name', () => expect(redDie.toString(), contains(redDie.name)));

    test('Rolls Match', () => expect(rolls, everyElement(allOf([
      damage(inInclusiveRange(1, 3)),
      range(0),
      surge(inInclusiveRange(0, 1))
    ]))));
  });

    group('Green Die Tests', () {
      GreenDie greenDie = new GreenDie();
      List<OffensiveDieFace> rolls = [];
      for (int i = 0; i < ROLL_AMOUNT; i++) {
        rolls.add(greenDie.roll());
      }

      test('Average Damage = 8/6', () => expect(greenDie.AverageDamage(), equals(8/6)));
      test('Average Surge = 3/6', () => expect(greenDie.AverageSurge(), equals(3/6)));
      test('Average Range = 10/6', () => expect(greenDie.AverageRange(), equals(10/6)));
      test('Green Die Name Correct', () => expect(greenDie.name, equals('Green Die')));
      test('Die Faces Correct Type', () => expect(greenDie.dieFaces, everyElement(new TypeMatcher<OffensiveDieFace>())));
      test('ToString() Contains Die Name', () => expect(greenDie.name, contains(greenDie.name)));

      test('Rolls Match', () => expect(rolls, everyElement(allOf([
        damage(inInclusiveRange(0, 2)),
        range(inInclusiveRange(1, 3)),
        surge(inInclusiveRange(0, 1))
      ]))));
    });

    group('Yellow Die Tests', () {
      YellowDie yellowDie = new YellowDie();
      List<OffensiveDieFace> rolls = [];
      for (int i = 0; i < ROLL_AMOUNT; i++) {
        rolls.add(yellowDie.roll());
      }

      test('Average Damage = 5/6', () => expect(yellowDie.AverageDamage(), equals(5/6)));
      test('Average Surge = 5/6', () => expect(yellowDie.AverageSurge(), equals(5/6)));
      test('Average Range = 6/6', () => expect(yellowDie.AverageRange(), equals(6/6)));
      test('Yellow Die Name Correct', () => expect(yellowDie.name, equals('Yellow Die')));
      test('Die Faces Correct Type', () => expect(yellowDie.dieFaces, everyElement(new TypeMatcher<OffensiveDieFace>())));
      test('ToString() Contains Die Name', () => expect(yellowDie.name, contains(yellowDie.name)));

      test('Rolls Match', () => expect(rolls, everyElement(allOf([
        damage(inInclusiveRange(0, 2)),
        range(inInclusiveRange(0, 2)),
        surge(inInclusiveRange(0, 2))
      ]))));
    });

    group('Blue Die Tests', () {
      BlueDie blueDie = new BlueDie();
      List<OffensiveDieFace> rolls = [];
      for (int i = 0; i < ROLL_AMOUNT; i++) {
        rolls.add(blueDie.roll());
      }
            
      test('Average Damage = 7/6', () => expect(blueDie.AverageDamage(), equals(7/6)));
      test('Average Surge = 2/6', () => expect(blueDie.AverageSurge(), equals(2/6)));
      test('Average Range = 19/6', () => expect(blueDie.AverageRange(), equals(19/6)));
      test('Blue Die Name Correct', () => expect(blueDie.name, equals('Blue Die')));
      test('Die Faces Correct Type', () => expect(blueDie.dieFaces, everyElement(new TypeMatcher<OffensiveDieFace>())));
      test('ToString() Contains Die Name', () => expect(blueDie.name, contains(blueDie.name)));
      test('Rolls Match', () => expect(rolls, everyElement(allOf([
        damage(inInclusiveRange(0, 2)),
        range(inInclusiveRange(2, 5)),
        surge(inInclusiveRange(0, 1))
      ]))));
    });

    group('Black Die Tests', () {
      BlackDie blackDie = new BlackDie();
      List<DefensiveDieFace> rolls = [];
      for (int i = 0; i < ROLL_AMOUNT; i++) {
        rolls.add(blackDie.roll());
      }

      test('Dodge Chance = 0/6', () => expect(blackDie.ChanceOfDodge(), equals(0)));
      test('Average Damage Blocked = 9/6', () => expect(blackDie.AverageDamageBlocked(), equals(9/6)));
      test('Average Surge Cancelled = 1/6', () => expect(blackDie.AverageSurgeCancelled(), equals(1/6)));
      test('Black Die Name Correct', () => expect(blackDie.name, equals('Black Die')));
      test('Die Faces Correct Type', () => expect(blackDie.dieFaces, everyElement(new TypeMatcher<DefensiveDieFace>())));
      test('ToString() Contains Die Name', () => expect(blackDie.name, contains(blackDie.name)));

      test('Rolls Match', () => expect(rolls, everyElement(allOf([
        damageBlocked(inInclusiveRange(0, 3)),
        predicate((DefensiveDieFace f) => !f.isDodge),
        surgeCancelled(inInclusiveRange(0, 1))
      ]))));
    });

    group('White Die Tests', () {
      WhiteDie whiteDie = new WhiteDie();
      List<DefensiveDieFace> rolls = [];
      for (int i = 0; i < ROLL_AMOUNT; i++) {
        rolls.add(whiteDie.roll());
      }

      test('Dodge Chance = 1/6', () => expect(whiteDie.ChanceOfDodge(), equals(1/6)));
      test('Average Damage Blocked = 3/6', () => expect(whiteDie.AverageDamageBlocked(), equals(3/6)));
      test('Average Surge Cancelled = 3/6', () => expect(whiteDie.AverageSurgeCancelled(), equals(3/6)));
      test('White Die Name Correct', () => expect(whiteDie.name, equals('White Die')));
      test('Die Faces Correct Type', () => expect(whiteDie.dieFaces, everyElement(new TypeMatcher<DefensiveDieFace>())));
      test('ToString() Contains Die Name', () => expect(whiteDie.name, contains(whiteDie.name)));
      test('Rolls Match', () => expect(rolls, everyElement(allOf([
        damageBlocked(inInclusiveRange(0, 1)),
        surgeCancelled(inInclusiveRange(0, 1))
      ]))));
    });
}

class _Damage extends CustomMatcher {
  _Damage(matcher) : super('Die Face with damage that is', 'damage', matcher);
  featureValueOf(actual) => actual.damage;
}

class _Range extends CustomMatcher {
  _Range(matcher) : super('Die Face with range that is', 'range', matcher);
  featureValueOf(actual) => actual.range;
}

class _Surge extends CustomMatcher {
  _Surge(matcher) : super('Die Face with surge that is', 'surge', matcher);
  featureValueOf(actual) => actual.surge;
}

class _DamageBlocked extends CustomMatcher {
  _DamageBlocked(matcher) : super('Die Face with damage blocked that is', 'damage blocked', matcher);
  featureValueOf(actual) => actual.damageBlocked;
}

class _SurgeCancelled extends CustomMatcher {
  _SurgeCancelled(matcher) : super('Die Face with surge cancelled that is', 'surge cancelled', matcher);
  featureValueOf(actual) => actual.surgeCancelled;
}