import 'package:dartz/dartz.dart';
import 'package:matcher/matcher.dart';

/// Adds convenient accessors for [Either].
extension DartzX<L, R> on Either<L, R> {
  /// Returns [R] or raises if this was an [L].
  R getOrRaise() => getOrElse(() => throw Exception('Unexpected Left: $this'));

  /// Returns [L] or raises if this was an [R].
  L leftOrRaise() =>
      fold((l) => l, (r) => throw Exception('Unexpected Right: $this'));
}

/// Testing matcher for whether this was a [Left].
const Matcher isLeft = _IsLeft();

class _IsLeft extends Matcher {
  const _IsLeft();
  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      (item as Either?)!.isLeft();

  @override
  Description describe(Description description) => description.add('is-left');
}

/// Testing matcher for whether this was a [Right].
const Matcher isRight = _IsRight();

class _IsRight extends Matcher {
  const _IsRight();
  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      (item as Either?)!.isRight();

  @override
  Description describe(Description description) => description.add('is-right');
}
