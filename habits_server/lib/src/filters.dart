// ignore_for_file: strict_raw_type

import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_server/src/generated/user.dart';
import 'package:habits_shared/habits_shared.dart' as habits_shared;
import 'package:serverpod/serverpod.dart';

/// Indicator of AND or OR boolean logic.
enum BooleanLogic {
  /// AND logic where all descendants must resolve to true
  and,

  /// OR logic where at least one descendant must resolve to true
  or
}

/// Converts filters into Serverpod database [Expression] values.
extension FilterExpression on habits_shared.Filter {
  /// Converts this [habits_shared.Filter] into an [Expression].
  Expression get expression {
    return switch (this) {
      final habits_shared.UserFilter f => f.expression,
    };
  }
}

/// Folds the descendant filters below an AND or OR filter into a single
/// [Expression].
Expression combine(
  List<habits_shared.Filter> filters,
  BooleanLogic operator,
) {
  Expression? expression;
  for (final filter in filters) {
    if (expression == null) {
      expression = filter.expression;
    } else {
      expression = switch (operator) {
        BooleanLogic.and => expression & filter.expression,
        BooleanLogic.or => expression | filter.expression,
      };
    }
  }
  return expression!;
}

extension on habits_shared.UserFilter {
  Expression get expression => map(
        and: (f) => combine(f.children, BooleanLogic.and),
        or: (f) => combine(f.children, BooleanLogic.or),
        uidEquals: (f) => User.t.uid.equals(UuidValue.fromString(f.uid)),
      );
}
