import 'package:app_client/app_client.dart';
import 'package:serverpod_client/serverpod_client.dart';

/// {@template ServerpodSource}
/// {@endtemplate}
abstract class ServerpodSource<T, K> extends Source<T, K> {
  /// {@macro ServerpodSource}
  ServerpodSource({required this.client});

  /// Reference to the main generated Serverpod client.
  final ServerpodClient client;

  /// Specific handler to this model's primary endpoint.
  // final EndpointRef endpoint;

  @override
  SourceType sourceType = SourceType.remote;

  @override
  Future<ReadResult<T>> getById(K id, RequestDetails details);

  @override
  Future<ReadListResult<T, K>> getByIds(Set<K> ids, RequestDetails details);

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails details);

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails details);

  @override
  Future<WriteListResult<T>> setItems(List<T> items, RequestDetails details);
}
