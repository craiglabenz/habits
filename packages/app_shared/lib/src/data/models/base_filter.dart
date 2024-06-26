import 'package:app_shared/app_shared.dart';

/// {@template Filter}
/// Base class for applying logical filters to sets of objects.
/// {@endtemplate}
abstract class BaseFilter {
  /// {@macro Filter}
  const BaseFilter();

  /// Returns true if the given object satisfies the requirements.
  bool apply(Object obj);

  /// Returns the (sub)set of the given objects which satisfy the requirements.
  Iterable<Object> applyToList(Iterable<Object> objs) => objs.where(apply);

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

/// Convenience rules for applying lists of filters to objects.
extension FilterList on Iterable<BaseFilter> {
  /// Applies filters to the in-memory object, requiring that all pass
  /// successfully.
  bool apply(Object obj) => every((f) => f.apply(obj));

  /// Applies filters to the in-memory object, requiring that at least one
  /// passes successfully.
  bool applyAny(Object obj) => any((f) => f.apply(obj));

  /// Applies all filters to the in-memory object.
  Iterable<Object> applyToList(Iterable<Object> items) => items.where(apply);

  /// Collapses all filters into a single [Map] suitable for GET query
  /// parameters.
  Params allParams() => fold({}, (prev, f) => prev..addAll(f.toParams()));
}
