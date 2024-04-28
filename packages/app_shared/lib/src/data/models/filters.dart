import 'package:app_shared/app_shared.dart';

/// {@template Filter}
/// Base class for applying logical filters to sets of objects.
/// {@endtemplate}
abstract class Filter<T> {
  /// {@macro Filter}
  const Filter();

  /// Returns true if the given object satisfies the requirements.
  bool apply(T obj);

  /// Returns the (sub)set of the given objects which satisfy the requirements.
  Iterable<T> applyToList(Iterable<T> objs) => objs.where(apply);

  /// Converts a filter to the details needed for a given Rest API. Because not
  /// all filters will be used with such APIs, this method is not required to be
  /// implemented. Also, because said implementation will be tied to the rules
  /// of said API, it is likely that dedicated filters will be needed for each
  /// and every Rest API.
  Params toParams() => throw UnimplementedError();

  /// Serialization rules for this filter for transportation between the client
  /// and server.
  Json toJson();
}

// @Freezed()
// class ComboFilter<T> extends Filter<T> with _$ComboFilter<T> {
//   const ComboFilter._();
//   const factory ComboFilter.and(List<Filter<T>> children) = AndFilter;
//   const factory ComboFilter.or(List<Filter<T>> children) = OrFilter;

//   factory ComboFilter.fromJson(Json json) {
//     return _$ComboFilterFromJson(json);
//   }

//   @override
//   bool apply(obj) => map(
//         and: (f) => children.every((f) => f.apply(obj)),
//         or: (f) => children.any((f) => f.apply(obj)),
//       );
// }

extension on DateTime {
  /// Shorter [toIso8601String] getter.
  // ignore: unused_element
  String get iso => toIso8601String();
}

extension on DateTime? {
  /// Easy greater than comparison for DateTimes.
  // ignore: unused_element
  bool operator >(DateTime other) =>
      this != null && this!.difference(other) > Duration.zero;

  /// Easy less than comparison for DateTimes.
  // ignore: unused_element
  bool operator <(DateTime other) =>
      this != null && this!.difference(other) < Duration.zero;

  // ignore: unused_element
  bool operator >=(DateTime other) =>
      this != null && this!.difference(other) >= Duration.zero;
  // ignore: unused_element
  bool operator <=(DateTime other) =>
      this != null && this!.difference(other) <= Duration.zero;
}

/// Convenience rules for applying lists of filters to objects.
extension FilterList<T> on List<Filter<T>> {
  /// Applies filters to the in-memory object, requiring that all pass
  /// successfully.
  bool apply(T obj) => every((f) => f.apply(obj));

  /// Applies filters to the in-memory object, requiring that at least one
  /// passes successfully.
  bool applyAny(T obj) => any((f) => f.apply(obj));

  /// Applies all filters to the in-memory object.
  Iterable<T> applyToList(Iterable<T> items) => items.where(apply);

  /// Collapses all filters into a single [Map] suitable for GET query
  /// parameters.
  Params allParams() => fold({}, (prev, f) => prev..addAll(f.toParams()));
}
