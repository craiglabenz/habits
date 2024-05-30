import 'dart:io';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habits_client/habits_client.dart';
import 'package:logging/logging.dart';

part 'results.freezed.dart';

final _log = Logger('data.sources.results');

//////////////////
/// WRITE RESULTS
//////////////////

/// {@template WriteSuccess}
/// Container for a single object write request which did not encounter any
/// errors.
/// {@endtemplate}
@Freezed()
class WriteSuccess<T> with _$WriteSuccess<T> {
  /// {@macro WriteSuccess}
  ///
  /// [item] is not nullable because, even if the endpoint in question does not
  /// return the updated version of the model back to us, this write method
  /// should return the object it was given.
  /// It is assumed that, at a minimum, if the write request generated a new
  /// ID for the object, that [item] will have that ID assigned.
  const factory WriteSuccess(T item, {required RequestDetails details}) =
      _WriteSuccess;
}

/// {@template BulkWriteSuccess}
/// Container for a list write request which did not encounter any errors.
/// {@endtemplate}
@Freezed()
class BulkWriteSuccess<T> with _$BulkWriteSuccess<T> {
  /// {@macro BulkWriteSuccess}
  const factory BulkWriteSuccess(
    List<T> items, {
    required RequestDetails details,
  }) = _BulkWriteSuccess;
}

/// Note that the result set may be empty, which is not an error.

/// {@template WriteFailure}
/// Represents a failure with the write, resulting from either an unexpected
/// problem on the server or the server rejecting the client's request.
/// The `message` property should be suitable for showing the user.
///
/// This class is used for errors that occurred on either a detail write or a
/// bulk write.
/// {@endtemplate}
@Freezed()
class WriteFailure<T> with _$WriteFailure<T> {
  const WriteFailure._();

  /// Container for a write request that failed to a problem on the server.
  const factory WriteFailure.serverError(String message) = _WriteServerError;

  /// Container for a write request that failed to a problem with the request.
  const factory WriteFailure.badRequest(String message) = _WriteClientError;

  /// Container for a write request that failed due to missing data.
  factory WriteFailure.notFoundException(NotFoundException e) =>
      WriteFailure.serverError('Not found: ${e.model.name.capitalize()}');

  /// Constructor which converts an [ApiSuccess] into the appropriate flavor of
  /// [WriteFailure]. This likely occurred because the API responded with a
  /// "200 OK" response which did not contain data we could hydrate into an
  /// instance of [T].
  factory WriteFailure.fromApiSuccess(ApiSuccess s) {
    _log.severe('Could not determine WriteSuccess from $s');
    return s.body.map(
      html: (b) => WriteFailure.serverError(
        'Unexpected HTML response from ${s.url}',
      ),
      json: (b) => WriteFailure.serverError(
        'Unable to convert Json into data from ${s.url}',
      ),
      plainText: (b) => WriteFailure.serverError(
        'Unexpected plain text response from ${s.url}',
      ),
    );
  }

  /// Constructor which turns an [ApiError] instance into the appropriate flavor
  /// of [WriteFailure].
  factory WriteFailure.fromApiError(ApiError e) {
    if (e.statusCode >= HttpStatus.badRequest &&
        e.statusCode < HttpStatus.internalServerError) {
      return WriteFailure.badRequest(e.error.plain);
    } else if (e.statusCode >= HttpStatus.internalServerError) {
      return WriteFailure.serverError(e.error.plain);
    }
    // TODO(craiglabenz): Log `e.errorString`
    return WriteFailure.serverError(
      'Unexpected error: ${e.statusCode} ${e.error.plain}',
    );
  }
}

/// Either a [WriteFailure] or a [WriteSuccess].
typedef WriteResult<T> = Either<WriteFailure<T>, WriteSuccess<T>>;

/// Either a [WriteFailure] or a [BulkWriteSuccess].
typedef WriteListResult<T> = //
    Either<WriteFailure<T>, BulkWriteSuccess<T>>;

/////////////////
/// READ RESULTS
/////////////////

/// {@template ReadSuccess}
/// Container for the results of a single object read that did not encounter any
/// errors. Note that the requested object may be null, which is not an error.
/// {@endtemplate}
@Freezed()
class ReadSuccess<T> with _$ReadSuccess<T> {
  /// {@macro ReadSuccess}
  const factory ReadSuccess(
    T? item, {
    required RequestDetails details,
  }) = _ReadSuccess;
}

/// {@template ReadSuccess}
/// Container for the results of a list read that did not encounter any errors.
/// Note that the list of results may be empty, which is not an error.
/// {@endtemplate}
@Freezed()
class ReadListSuccess<T, K> with _$ReadListSuccess<T, K> {
  /// {@macro ReadSuccess}
  const factory ReadListSuccess({
    required List<T> items,
    required Map<K, T> itemsMap,
    required RequestDetails details,
  }) = _ReadListSuccess;
  const ReadListSuccess._();

  /// Convenience constructor for empty read results.
  factory ReadListSuccess.empty(RequestDetails details) => ReadListSuccess(
        items: [],
        itemsMap: {},
        details: details,
      );

  /// Map-friendly constructor.
  factory ReadListSuccess.fromMap(
    Map<K, T> map,
    RequestDetails details,
  ) =>
      ReadListSuccess(
        items: map.values.toList(),
        itemsMap: map,
        details: details,
      );

  /// List-friendly constructor.
  factory ReadListSuccess.fromList(
    List<T> items,
    RequestDetails details,
    K? Function(T) getId,
  ) {
    final map = <K, T>{};
    for (final item in items) {
      map[getId(item)!] = item;
    }
    return ReadListSuccess(
      items: items,
      itemsMap: map,
      details: details,
    );
  }
}

/// Represents a failure with the read, resulting from either an unexpected
/// problem on the server or the server rejecting the client's request.
/// The `message` property should be suitable for showing the user.
///
/// This class is used for errors that occurred on either a detail read or a
/// list read.
@Freezed()
class ReadFailure<T> with _$ReadFailure<T> {
  /// Container for a read request that failed to a problem on the server.
  const factory ReadFailure.serverError(String message) = _ReadServerError;

  /// Container for a read request that failed to a problem with the request.
  const factory ReadFailure.badRequest(String message) = _ReadClientError;

  /// Container for a read request that failed due to missing data.
  factory ReadFailure.notFoundException(NotFoundException e) =>
      ReadFailure.serverError('Not found: ${e.model.name.capitalize()}');

  /// Constructor which turns an [ApiError] instance into the appropriate flavor
  /// of [ReadFailure].
  factory ReadFailure.fromApiError(ApiError e) {
    if (e.statusCode >= HttpStatus.badRequest &&
        e.statusCode < HttpStatus.internalServerError) {
      return ReadFailure.badRequest(e.error.plain);
    } else if (e.statusCode >= HttpStatus.internalServerError) {
      return ReadFailure.serverError(e.error.plain);
    }
    // TODO(craiglabenz): Log `e.errorString`
    return ReadFailure.serverError(
      'Unexpected error: ${e.statusCode} ${e.error.plain}',
    );
  }
}

/// Either a [ReadFailure] or a [ReadSuccess].
typedef ReadResult<T> = Either<ReadFailure<T>, ReadSuccess<T>>;

/// Either a [ReadFailure] or a [ReadListSuccess].
typedef ReadListResult<T, K> = //
    Either<ReadFailure<T>, ReadListSuccess<T, K>>;
