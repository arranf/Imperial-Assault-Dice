import 'package:matcher/matcher.dart';

Matcher damage(m) => new _Damage(wrapMatcher(m));
Matcher range(m) => new _Range(wrapMatcher(m));
Matcher surge(m) => new _Surge(wrapMatcher(m));
Matcher damageBlocked(m) => new _DamageBlocked(wrapMatcher(m));
Matcher surgeCancelled(m) => new _SurgeCancelled(wrapMatcher(m));

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