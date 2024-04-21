// import 'package:get_it/get_it.dart';
// import 'package:serverpod_client/serverpod_client.dart';
import 'package:data/data.dart';

/// {@template repo}
/// Data abstraction most likely to be exposed to other layers of the
/// application. Subclasses of this are where domain-specific logic should live.
/// {@endtemplate}
class Repository<T, K> extends DataContract<T, K> {
  /// {@macro repo}
  Repository(this.sourceList);

  /// Data loader within a [Repository] which can cascade through a list of data
  /// sources, treating each as a write-through cache.
  final SourceList<T, K> sourceList;

  @override
  Future<ReadResult<T>> getById(K id, RequestDetails<T> details) =>
      sourceList.getById(id, details);

  @override
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails<T> details,
  ) =>
      sourceList.getByIds(ids, details);

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails<T> details) =>
      sourceList.getItems(details);

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails<T> details) =>
      sourceList.setItem(item, details);

  @override
  Future<WriteListResult<T>> setItems(
    List<T> items,
    RequestDetails<T> details,
  ) =>
      sourceList.setItems(items, details);
}
