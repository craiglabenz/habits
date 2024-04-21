import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

/// {@template Source}
/// Parent type of all entries in a [SourceList]. Each [Source] subtype should
/// know how to load data from a particular place. The field [sourceType]
/// indicates whether that place is immediately accessible (and thus is a cache)
/// or is remotely accessible and thus is the source of truth.
/// {@endtemplate }
abstract class Source<T, K> extends DataContract<T, K> {
  /// Indicator for whether this [Source] loads data from a store on-device, or
  /// off-device.
  SourceType get sourceType;

  /// True if this [Source] is of type [SourceType.local];
  bool get isLocal => sourceType.isLocal;

  /// True if this [Source] is of type [SourceType.remote];
  bool get isRemote => sourceType.isRemote;

  /// Meta-information values for this data type. This field is set by the
  /// [SourceList].
  late final Bindings<T, K> bindings;

  /// Hydrates a new created item or returns a failure.
  Either<WriteFailure<T>, WriteSuccess<T>> createdItemOr(
    T item,
    RequestDetails<T> details,
  ) =>
      bindings.getId(item) == null
          ? Left(WriteFailure<T>.serverError('Failed to save item'))
          : Right(WriteSuccess<T>(item, details: details));

  /// Returns a loaded item if it was found.
  Either<ReadFailure<T>, ReadSuccess<T>> itemOr(
    T? item,
    RequestDetails<T> details,
  ) {
    return Right(ReadSuccess<T>(item, details: details));
  }

  /// Converts a map of items into a [ReadListSuccess].
  Either<ReadFailure<T>, ReadListSuccess<T, K>> mapOr(
    Map<K, T>? items,
    RequestDetails<T> details,
  ) =>
      Right(ReadListSuccess<T, K>.fromMap(items ?? {}, details));

  @override
  String toString() => '$runtimeType()';
}

/// Classifier for a given [Source] instance's primary data location.
enum SourceType {
  /// Indicates a given [Source] retrieves its data from an on-device store.
  local,

  /// Indicates a given [Source] retrieves its data from an off-device store.
  remote;

  /// Accepts a handler for each [SourceType] variant and runs the appropriate
  /// handler for which flavor this instance is.
  T map<T>({
    required T Function(SourceType) local,
    required T Function(SourceType) remote,
  }) {
    return switch (this) {
      SourceType.local => local(this),
      SourceType.remote => remote(this),
    };
  }

  /// Returns true if this is [SourceType.local].
  bool get isLocal => switch (this) {
        SourceType.local => true,
        SourceType.remote => false,
      };

  /// Returns true if this is [SourceType.remote].
  bool get isRemote => switch (this) {
        SourceType.local => false,
        SourceType.remote => true,
      };
}
