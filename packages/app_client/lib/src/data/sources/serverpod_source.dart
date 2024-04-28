import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:serverpod_client/serverpod_client.dart';

/// {@template ServerpodSource}
/// {@endtemplate}
abstract class ServerpodSource<T extends Model<K>, K> extends Source<T, K> {
  /// {@macro ServerpodSource}
  ServerpodSource({required this.client, required this.endpoint});

  /// Reference to the main generated Serverpod client.
  final ServerpodClient client;

  /// Specific handler to this model's primary endpoint.
  final EndpointRef endpoint;

  @override
  SourceType sourceType = SourceType.remote;

  @override
  Future<ReadResult<T>> getById(K id, RequestDetails<T> details);

  @override
  Future<ReadListResult<T, K>> getByIds(Set<K> ids, RequestDetails<T> details);

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails<T> details);

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails<T> details);

  @override
  Future<WriteListResult<T>> setItems(List<T> items, RequestDetails<T> details);
}
