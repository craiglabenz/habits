import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_shared/habits_shared.dart';
import 'package:serverpod/serverpod.dart';

enum BooleanLogic { and, or }

extension FilterExpression on Filter {
  Expression get expression {
    return switch (this) {
      UserFilter f => f.expression,
    };
  }
}

Expression combine(List<Filter> filters, BooleanLogic operator) {
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

extension on UserFilter {
  Expression get expression => map(
        and: (f) => combine(f.children, BooleanLogic.and),
        or: (f) => combine(f.children, BooleanLogic.or),
        uidEquals: (f) => User.t.uid.equals(UuidValue.fromString(f.uid)),
      );
}
