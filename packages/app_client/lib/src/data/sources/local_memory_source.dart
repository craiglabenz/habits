import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

/// {@template LocalMemorySource}
/// On-device, in-memory store which caches previously loaded data for
/// instantaneous retrieval. Does not persist any data across sessions.
/// {@endtemplate}
class LocalMemorySource<T, K> extends Source<T, K> {
  /// {@macro LocalMemorySource}
  LocalMemorySource({this.canSetIds = false});

  final _log = Logger('LocalMemorySource<$T, $K>');

  /// Map of the stored items, with database primary keys as map keys.
  Map<K, T> items = {};

  /// Computed set of all known Ids.
  Set<K> get itemIds => items.keys.toSet();

  /// Set of request types known to have no results. This differentiates a
  /// first-time request from a request which has already gone to the server and
  /// returned zero objects.
  Set<int> knownEmptySets = {};

  /// Map of request hashes to the Ids they returned.
  Map<int, Set<K>> requestCache = {};

  @override
  SourceType get sourceType => SourceType.local;

  /// If false, `setItem` will require that new objects have non-null `id`
  /// values.
  bool canSetIds;

  /// Returns the object with the given `id`, as long as the item is associated
  /// with the given setName in `details`.
  @override
  Future<ReadResult<T>> getById(K id, RequestDetails<T> details) {
    T? item;
    if (!requestCache.containsKey(details.cacheKey)) {
      item = null;
    } else if (!requestCache[details.cacheKey]!.contains(id)) {
      item = null;
    } else {
      item = items[id];
    }
    return Future.value(
      Right(ReadSuccess(item, details: details)),
    );
  }

  /// Used for bulk read methods that neither want inner futures nor
  /// ReadResults.
  T? _getByIdSync(K id, RequestDetails<T> details) {
    if (!requestCache.containsKey(details.cacheKey)) return null;
    if (!requestCache[details.cacheKey]!.contains(id)) return null;
    return items[id];
  }

  /// Returns all known items from the set of IDs. Any id values not found
  /// appear in `missingItemIds`.
  @override
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails<T> details,
  ) async {
    details.assertEmpty('getByIds');
    final itemsById = <K, T>{};
    for (final id in ids) {
      final maybeItem = _getByIdSync(id, details);
      if (maybeItem != null) {
        itemsById[id] = maybeItem;
      }
    }
    return Right(
      ReadListSuccess<T, K>.fromMap(itemsById, details),
    );
  }

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails<T> details) async {
    if (knownEmptySets.contains(details.cacheKey)) {
      _log.finer('Requested data from known empty set: $details');
      return Right(ReadListSuccess<T, K>.empty(details));
    }

    // If this is a new request, see if we happen to be able to fulfill it from
    // previously loaded data. For example, if we have previously loaded all
    // necessary items. Note that we never optimistically fill this request here
    // if the request is paginated. Typically, this hits when the request is
    // asking for specific Ids.
    if (!requestCache.containsKey(details.cacheKey)) {
      return _applyFirstTimeRequest(details);
    }

    final itemsIter =
        requestCache[details.cacheKey]!.map<T>((K id) => items[id]!);

    final filteredItemsIter = details.filters.applyToList(itemsIter);
    // final filteredItemsIter = itemsIter.where(
    //   (T obj) => details.filters.predicates(obj),
    // );

    /// If a cached result no longer fully and perfectly passed all of its
    /// intended filters, then some data was written via `setItem` or `setItems`
    /// alongside filters it did not even pass. In this scenario, there is
    /// obviously something wrong with that cache key, so clear it, log the
    /// behavior, and return an empty set.
    if (filteredItemsIter.length != itemsIter.length) {
      final removed = itemsIter.toSet().difference(filteredItemsIter.toSet());
      requestCache.remove(details.cacheKey);
      _log.severe(
        'getItems cache hit for $details contained objects which did not pass '
        'all filters. The removed items were: $removed',
      );
      return Right(ReadListSuccess<T, K>.empty(details));
    }

    return Right(
      ReadListSuccess<T, K>.fromList(
        itemsIter.toList(),
        details,
        bindings.getId,
      ),
    );
  }

  ReadListResult<T, K> _applyFirstTimeRequest(RequestDetails<T> details) {
    // Unseen requests with pagination cannot be fulfilled, as we cannot know we
    // have all the results for that page. Returning an empty result here will
    // force the [SourceList] to make a complete request to the server, which
    // will tell us if we have this page's information.
    if (details.pagination != null) {
      return Right(ReadListSuccess.fromList([], details, bindings.getId));
    }

    return Right(
      ReadListSuccess.fromList(
        details.filters.applyToList(items.values).toList(),
        details,
        bindings.getId,
      ),
    );
  }

  /// Sets an Id value to this item. This is valuable if you have a [Repository]
  /// and [SourceList] which only contain local sources, yet you still want to
  /// have new Ids set when a record is saved.
  ///
  /// In practice, this is either a function for data that will never leave the
  /// user's device (aka, is not ever saved to the server), or for testing the
  /// behavior of [SourceList] or [Repository] implementations.
  T setId(T item) {
    assert(
      bindings.getId(item) == null,
      'Unexpectedly called `setId` on item with an `id` value of '
      '${bindings.getId(item)}',
    );
    return bindings.fromJson(
      (bindings.toJson(item))..update('id', (value) => const Uuid().v4()),
    );
  }

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails<T> details) async {
    assert(
      canSetIds || bindings.getId(item) != null,
      'LocalMemorySource can only persist items with an Id. To allow this '
      'source to set Ids, set `canSetIds` to true.',
    );

    var itemCopy = bindings.copy(item);

    if (bindings.getId(itemCopy) == null) {
      itemCopy = setId(itemCopy);
    }

    final itemCopyId = bindings.getId(itemCopy) as K;

    if (details.shouldOverwrite || !items.containsKey(itemCopyId)) {
      items[itemCopyId] = itemCopy;
    }
    if (!requestCache.containsKey(details.cacheKey)) {
      requestCache[details.cacheKey] = <K>{};
    }
    if (!requestCache.containsKey(details.empty.cacheKey)) {
      requestCache[details.empty.cacheKey] = <K>{};
    }
    requestCache[details.cacheKey]!.add(itemCopyId);

    if (details.isNotEmpty) {
      requestCache[details.empty.cacheKey]!.add(itemCopyId);
    }
    return Right(WriteSuccess<T>(itemCopy, details: details));
  }

  @override
  Future<WriteListResult<T>> setItems(
    List<T> items,
    RequestDetails<T> details,
  ) {
    for (final item in items) {
      setItem(item, details);
    }
    return Future.value(Right(BulkWriteSuccess<T>(items, details: details)));
  }
}
