import 'package:app_client/app_client.dart';

/// {@template DataContract}
/// Outline of core methods to which all data loaders must adhere.
/// {@endtemplate}
mixin DataContract<T, K> {
  /// Loads the instance of [T] whose primary key is [id].
  Future<ReadResult<T>> getById(K id, RequestDetails details);

  /// Loads all instances of [T] whose primary key is in the set [ids].
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails details,
  );

  /// Loads all instances of [T] that satisfy any filtes or pagination on
  /// [details].
  Future<ReadListResult<T, K>> getItems(RequestDetails details);

  /// Persists [item].
  Future<WriteResult<T>> setItem(T item, RequestDetails details);

  /// Persists all [items].
  Future<WriteListResult<T>> setItems(List<T> items, RequestDetails details);
}
