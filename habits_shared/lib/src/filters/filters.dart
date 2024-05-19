import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habits_client/habits_client.dart';

part 'filters.freezed.dart';
part 'filters.g.dart';

/// Wrapper around all filters for this actual app.
sealed class Filter<T> extends BaseFilter<T> {
  const Filter();
}

/// Helper to apply client or server-side filters to collections of [User]
/// objects.
@Freezed()
class UserFilter extends Filter<User> with _$UserFilter {
  const UserFilter._();

  /// Combines multiple [UserFilter] objects with AND boolean logic.
  const factory UserFilter.and(List<UserFilter> children) = AndUserFilter;

  /// Combines multiple [UserFilter] objects with OR boolean logic.
  const factory UserFilter.or(List<UserFilter> children) = OrUserFilter;

  /// Filters on [User] objects whose Id matches the given Id. Naturally, this
  /// should only yield one value.
  const factory UserFilter.uidEquals(String uid) = UidEqualsUserFilter;

  /// [Json] deserializing constructor for [UserFilter].
  factory UserFilter.fromJson(Json json) => _$UserFilterFromJson(json);

  @override
  bool apply(User obj) => map(
        and: (f) => f.children.every((child) => child.apply(obj)),
        or: (f) => f.children.any((child) => child.apply(obj)),
        uidEquals: (f) => obj.uid.uuid == f.uid,
      );
}
