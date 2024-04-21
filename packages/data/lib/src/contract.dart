import 'package:data/data.dart';

/// {@template DataContract}
/// Outline of core methods to which all data loaders must adhere.
/// {@endtemplate}
abstract class DataContract<T, K> {
  /// {@macro DataContract}
  const DataContract();

  /// Loads the instance of [T] whose primary key is [id].
  Future<ReadResult<T>> getById(K id, RequestDetails<T> details);

  /// Loads all instances of [T] whose primary key is in the set [ids].
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails<T> details,
  );

  /// Loads all instances of [T] that satisfy any filtes or pagination on
  /// [details].
  Future<ReadListResult<T, K>> getItems(RequestDetails<T> details);

  /// Persists [item].
  Future<WriteResult<T>> setItem(T item, RequestDetails<T> details);

  /// Persists all [items].
  Future<WriteListResult<T>> setItems(List<T> items, RequestDetails<T> details);
}

/// Converter between arbitrary data types and [DataContract]-specific
/// assumptions.
abstract class DataBindings<T, K> {}

// /// Function signature for [DataContract.getById].
// typedef GetById<T> = Future<ReadResult<T>> Function(
//   String id,
//   RequestDetails<T> details,
// );

// /// Function signature for [DataContract.getByIds].
// typedef GetByIds<T> = Future<ReadListResult<T, K>> Function(
//   Set<String> ids,
//   RequestDetails<T> details,
// );

// /// Function signature for [DataContract.getItems].
// typedef GetItems<T> = Future<ReadListResult<T, K>> Function(
//   RequestDetails<T> details,
// );

// /// Function signature for [DataContract.setItem].
// typedef SetItem<T> = Future<WriteResult<T>> Function(
//   T item,
//   RequestDetails<T> details,
// );

// /// Function signature for [DataContract.setItems].
// typedef SetItems<T> = Future<WriteListResult<T>> Function(
//   List<T> items,
//   RequestDetails<T> details,
// );
