import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';

/// {@template ApiSource}
/// Flavor of [Source] which knows how to make network requests to load data.
/// {@endtemplate}
class ApiSource<T extends Model<K>, K> extends Source<T, K> {
  /// {@macro ApiSource}
  ApiSource({required this.api, ITimer? timer})
      : idsCurrentlyBeingFetched = <K>{},
        loadedItems = {},
        timer = timer ?? BatchTimer(),
        queuedIds = <K>{};

  late final _log = Logger('ApiSource<$T, $K>');

  /// Actual network-capable object which fulfills remote requests.
  final RestApi api;

  /// Clock-aware object used to batch Ids.
  final ITimer timer;

  /// Ids set to be loaded during the next batch.
  Set<K> queuedIds;

  /// Set of Ids currently being loaded, but which have not yet been resolved.
  Set<K> idsCurrentlyBeingFetched;

  /// Id-keyed store of [Completer] instances which are individually resolved
  /// when a batch is returned from the server.
  final Map<K, Completer<T?>> loadedItems;

  @override
  SourceType sourceType = SourceType.remote;

  @override
  Future<ReadResult<T>> getById(K id, RequestDetails<T> details) async {
    if (!loadedItems.containsKey(id) || !loadedItems[id]!.isCompleted) {
      queueId(id);
    }
    return Right(
      ReadSuccess<T>(await loadedItems[id]!.future, details: details),
    );
  }

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails<T> details) async {
    // final Params params = <String, String>{};
    // if (details.minId != null) {
    //   params['id__gt'] = details.minId;
    // }
    // if (details.maxId != null) {
    //   params['id__lt'] = details.maxId;
    // }

    // final bool shouldRefresh = details.requestType == RequestType.refresh &&
    //     lastUpdatedAt != null &&
    //     details.maxId == null;
    // if (shouldRefresh) {
    //   params['updated_since'] = lastUpdatedAt!.toUtc().toIso8601String();
    // }
    final result = await fetchItems(details.params);
    if (result is ApiError) {
      return Left(ReadFailure.fromApiError(result));
    } else {
      return Right(
        ReadListSuccess<T, K>.fromList(
          hydrateListResponse(result as ApiSuccess),
          details,
          bindings.getId,
        ),
      );
    }
  }

  @override
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails<T> details,
  ) async {
    assert(
      details.isEmpty,
      'ApiSource.getByIds must receive a RequestDetails object with only 1 '
      'filter, which is an IdsFilter. Received: ${details.filters}',
    );
    // details = details.addFilter(

    // );

    // final missingIds = <String>{};
    // if (details.filters.idsFilter != null) {
    //   final loadedIds = loadedItems.map<String>((obj) => obj.id!).toSet();
    //   missingIds.addAll(
    //     details.filters.idsFilter!.ids.difference(loadedIds),
    //   );
    // }
    return getItems(details);
    // throw UnimplementedError(
    //   'Are we deleting this in favor of an IdsIn filter?',
    // );
    // final idsDetails = details.copyWith(
    //   filters: List<Filter>.from(details.filters)..add(Filter.ids(ids)),
    // );
    // return getItems(idsDetails);
    // return bindings.getByIds(ids, details);
    // assert(details.filters.isEmpty, 'Must not supply filters to `getByIds`');

    // if (ids.isEmpty) {
    //   return Right(ReadListSuccess<T>.fromList([], details, {}));
    // }
    // final Params params = <String, String>{
    //   'id__in': ids.join(','),
    // };

    // final result = await fetchItems(params);

    // return result.map(
    //   success: (s) {
    //     final items = hydrateListResponse(result as ApiSuccess);
    //     final itemsById = <String, T>{};
    //     for (final item in items) {
    //       // Objects from the server must always have an Id set.
    //       itemsById[bindings.getId(item)!] = item;
    //     }

    //     final missingItemIds = <String>{};
    //     for (final id in ids) {
    //       if (!itemsById.containsKey(id)) {
    //         missingItemIds.add(id);
    //       }
    //     }

    //     return Right(
    //       ReadListSuccess<T>.fromMap(itemsById, details, missingItemIds),
    //     );
    //   },
    //   error: (e) => Left(ReadFailure.fromApiError(e)),
    // );
  }

  /// Prepares an Id to be loaded in the next batch.
  void queueId(K id) {
    if (!queuedIds.contains(id) && !idsCurrentlyBeingFetched.contains(id)) {
      _log.finer('Queuing Id $id');
      loadedItems[id] = Completer<T?>();
      queuedIds.add(id);
      timer
        ..cancel()
        ..start(const Duration(milliseconds: 1), loadDeferredIds);
    }
  }

  /// Submits any Ids currently in the queue for loading.
  Future<void> loadDeferredIds() async {
    _log.fine('Loading deferred ids: $queuedIds');
    queuedIds.forEach(idsCurrentlyBeingFetched.add);
    final ids = Set<K>.from(queuedIds);
    queuedIds.clear();
    final byIds = await getByIds(
      ids,
      RequestDetails<T>(),
    );
    byIds.fold(
      (ReadFailure<T> l) {
        for (final id in ids) {
          loadedItems[id]!.complete(null);
        }
      },
      (ReadListSuccess<T, K> r) {
        for (final id in r.itemsMap.keys) {
          if (!loadedItems.containsKey(id)) {
            continue;
          }
          if (!loadedItems[id]!.isCompleted) {
            idsCurrentlyBeingFetched.remove(id);
            loadedItems[id]!.complete(r.itemsMap[id]);
            loadedItems.remove(id);
          }
        }
      },
    );
  }

  /// Submits a network request for data.
  Future<ApiResponse> fetchItems(Params? params) {
    final request = ReadApiRequest(
      url: bindings.getListUrl(),
      params: params,
    );
    return api.get(request);
  }

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails<T> details) async {
    final request = WriteApiRequest(
      url: bindings.getId(item) == null //
          ? bindings.getListUrl()
          : bindings.getDetailUrl(item),
      body: bindings.toJson(item),
    );

    final result = await (bindings.getId(item) == null //
            ? api.post(request)
            : api.update(request) //
        );

    return result.map(
      success: (s) {
        final item = hydrateItemResponse(s);
        if (item != null) {
          return Right(
            WriteSuccess(item, details: details),
          );
        } else {
          return Left(WriteFailure.fromApiSuccess(s));
        }
      },
      error: (e) => Left(WriteFailure.fromApiError(e)),
    );
  }

  @override
  Future<WriteListResult<T>> setItems(
    List<T> items,
    RequestDetails<T> details,
  ) =>
      throw Exception('Cannot save items in bulk');

  /// Deserializes the result of a network request into the actual object(s).
  T? hydrateItemResponse(ApiSuccess success) => success.body.map(
        html: (HtmlApiResponseBody body) {
          // TODO(craiglabenz): Log this terrible news
          return null;
        },
        json: (JsonApiResponseBody body) {
          if (body.data.containsKey('results')) {
            // TODO(craiglabenz): log that this is unexpected for [result.url]
            if ((body.data['results']! as List).length != 1) {
              // TODO(craiglabenz): log that this is even more unexpected
            }
            final items = (body.data['results']! as List)
                .cast<Json>()
                .map<T>(bindings.fromJson)
                .toList();
            return items.first;
          } else {
            return bindings.fromJson(body.data);
          }
        },
        plainText: (PlainTextApiResponseBody body) => null,
      );

  /// Deserializes the results of a network request into the actual object(s).
  List<T> hydrateListResponse(ApiSuccess success) => success.body.map(
        html: (HtmlApiResponseBody body) {
          // TODO(craiglabenz): Log this terrible news
          return <T>[];
        },
        json: (JsonApiResponseBody body) {
          if (body.data.containsKey('results')) {
            final List<Map<String, dynamic>> results =
                (body.data['results']! as List).cast<Json>();
            final items = results.map<T>(bindings.fromJson).toList();
            return items;
          } else {
            return [bindings.fromJson(body.data)];
          }
        },
        plainText: (PlainTextApiResponseBody body) => <T>[],
      );
}
