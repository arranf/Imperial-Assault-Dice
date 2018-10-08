import 'package:matcher/matcher.dart';

class _Damage extends CustomMatcher {
  _Damage(matcher) : super('Die Face with damage that is', 'damage', matcher);
  featureValueOf(actual) => actual.damage;
}