import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:equatable/equatable.dart';
// ignore: implementation_imports
import 'package:equatable/src/equatable_utils.dart';

/// {@template RequestDetails}
/// Container for meta-information a [Source] will use to return the desired
/// data.
/// {@endtemplate}
// ignore: must_be_immutable
abstract class RequestDetails<T> extends Equatable {
  /// {@macro RequestDetails}
  factory RequestDetails({
    List<Filter<T>>? filters,
    Pagination? pagination,
    RequestType? requestType,
    bool? shouldOverwrite,
  }) = _RequestDetailsImpl;

  RequestDetails._({
    this.filters = const [],
    this.pagination,
    this.requestType = defaultRequestType,
    this.shouldOverwrite = defaultShouldOverwrite,
  });

  /// Optional list of filters for this read request. Filters are only used
  /// during writes to local sources and reads from any source.
  final List<Filter<T>> filters;

  /// Optional pagination for this request. Pagination details are only used
  /// for local sources - of course this has no impact when writing to the
  /// server.
  final Pagination? pagination;

  /// Reach of this request.
  final RequestType requestType;

  /// Whether data should overwrite existing data with the same Id.
  final bool shouldOverwrite;

  /// Returns a new [RequestDetails] with any passed fields overwritten with the
  /// new values.
  RequestDetails<T> copyWith({
    List<Filter<T>>? filters,
    Pagination? pagination,
    RequestType? requestType,
    bool? shouldOverwrite,
  });

  /// Indicates whether the filters AND pagination are empty.
  bool get isEmpty => filters.isEmpty && pagination == null;

  /// Indicates whether the filters OR pagination are not empty.
  bool get isNotEmpty => !isEmpty;

  /// Returns the [isEmpty] version of this [RequestDetails] object.
  RequestDetails<T> get empty => RequestDetails<T>(requestType: requestType);

  /// Asserts that this instance [isEmpty]. The lone string parameter is useful
  /// for easily seeing where this assertion was called.
  void assertEmpty(String functionName) {
    assert(isEmpty, 'Must not supply filters or pagination to $functionName');
  }

  int? _cacheKey;

  /// Collapses this request into a key suitable for local memory caching.
  /// This key should incorporate everything about this request EXCEPT the
  /// requestType, as that would create false-positive variance.
  int get cacheKey => _cacheKey ??= _getCacheKey();

  int _getCacheKey() =>
      runtimeType.hashCode ^
      mapPropsToHashCode([
        filters,
        pagination,
      ]);

  @override
  String toString() {
    return 'RequestDetails(filters: $filters, pagination: $pagination, '
        'requestType: $requestType, shouldOverwrite: $shouldOverwrite)';
  }

  /// Returns the [Params] value from this object's list of [Filter]s.
  Params get params => filters.allParams();

  @override
  List<Object?> get props =>
      [filters, pagination, requestType, shouldOverwrite];
}

// ignore: must_be_immutable
class _RequestDetailsImpl<T> extends RequestDetails<T> {
  _RequestDetailsImpl({
    List<Filter<T>>? filters,
    super.pagination,
    RequestType? requestType,
    bool? shouldOverwrite,
  }) : super._(
          filters: filters ?? const [],
          requestType: requestType ?? defaultRequestType,
          shouldOverwrite: shouldOverwrite ?? defaultShouldOverwrite,
        );

  @override
  RequestDetails<T> copyWith({
    Object? filters = _Undefined,
    Object? pagination = _Undefined,
    Object? requestType = _Undefined,
    Object? shouldOverwrite = _Undefined,
  }) {
    return RequestDetails<T>(
      filters: filters is List<Filter<T>>? ? filters : this.filters,
      pagination: pagination is Pagination? ? pagination : this.pagination,
      requestType: requestType is RequestType? ? requestType : this.requestType,
      shouldOverwrite:
          shouldOverwrite is bool? ? shouldOverwrite : this.shouldOverwrite,
    );
  }
}

class _Undefined {}

// part 'request_details.freezed.dart';
// part 'request_details.g.dart';

/// {@template RequestDetails}
/// Container for meta-information a [Source] will use to return the desired
/// data.
/// {@endtemplate}
// @Freezed()
// class RequestDetails with _$RequestDetails {
//   /// {@macro RequestDetails}
//   const factory RequestDetails({
//     /// Optional list of filters for this read request. Filters are only used
//     /// during writes to local sources and reads from any source.
//     @ReadFilterConverter() @Default(<ReadFilter>[]) List<ReadFilter> filters,

//     /// Reach of this request.
//     @Default(defaultRequestType) RequestType requestType,

//     /// Whether data should overwrite existing data with the same Id.
//     @Default(defaultShouldOverwrite) bool shouldOverwrite,

//     /// Optional pagination for this request. Pagination details are only used
//     /// for local sources - of course this has no impact when writing to the
//     /// server.
//     @PaginationConverter() Pagination? pagination,
//   }) = _RequestDetails;

//   const RequestDetails._();

//   /// [Json] deserialization constructor for [RequestDetails].
//   /// ignore: avoid_unused_constructor_parameters
//   factory RequestDetails.fromJson(Json json, SerializationManager manager) =>
//       _$RequestDetailsFromJson(json);

//   /// Returns the [isEmpty] version of this [RequestDetails] object.
//   RequestDetails get empty => RequestDetails(requestType: requestType);

//   /// Collapses this request into a key suitable for local memory caching.
//   /// This key should incorporate everything about this request EXCEPT the
//   /// requestType, as that would create false-positive variance.
//   int get cacheKey =>
//       runtimeType.hashCode ^
//       mapPropsToHashCode([
//         ...filters.map<int>((filter) => filter.hashCode),
//         pagination,
//       ]);

//   /// Indicates whether the filters AND pagination are empty.
//   bool get isEmpty => filters.isEmpty && pagination == null;

//   /// Indicates whether the filters OR pagination are not empty.
//   bool get isNotEmpty => !isEmpty;

//   /// Asserts that this instance [isEmpty]. The lone string parameter is useful
//   /// for easily seeing where this assertion was called.
//   void assertEmpty(String functionName) {
//   assert(isEmpty, 'Must not supply filters or pagination to $functionName');
//   }
// }

// /// {@template RequestDetailsConverter}
// /// [Json] converter for [RequestDetails].
// /// {@endtemplate}
//class RequestDetailsConverter implements JsonConverter<RequestDetails, Json> {
//   /// {@macro RequestDetailsConverter}
//   const RequestDetailsConverter();

//   @override
//   RequestDetails fromJson(Json json) =>
//       RequestDetails.fromJson(json, Protocol());

//   @override
//   Json toJson(RequestDetails obj) => obj.toJson();
// }

// /// {@template RequestDetails}
// /// Container for meta-information a [Source] will use to return the desired
// /// data.
// /// {@endtemplate}
// // class RequestDetails<T> extends Equatable {
// //   /// {@macro RequestDetails}
// //   RequestDetails({
// //     this.filters = const [],
// //     this.requestType = defaultRequestType,
// //     this.pagination,
// //     this.shouldOverwrite = defaultShouldOverwrite,
// //   });

// //   /// Read-friendly constructor for [RequestDetails].
// //   factory RequestDetails.read({
// //     RequestType requestType = defaultRequestType,
// //     List<ReadFilter<T>> filters = const [],
// //     Pagination? pagination,
// //   }) =>
// //       RequestDetails(
// //         requestType: requestType,
// //         filters: filters,
// //         pagination: pagination,
// //       );

// //   /// Write-friendly constructor for [RequestDetails]. Write [RequestDetails]
// //   /// surprisingly contain pagination details for the purposes of write-through
// //   /// caches.
// //   factory RequestDetails.write({
// //     RequestType requestType = defaultRequestType,
// //     bool shouldOverwrite = defaultShouldOverwrite,
// //     Pagination? pagination,
// //   }) =>
// //       RequestDetails(
// //         requestType: requestType,
// //         shouldOverwrite: shouldOverwrite,
// //         pagination: pagination,
// //       );

// //   /// {@macro RequestType}
// //   final RequestType requestType;

// //   /// List of filters for this request.
// //   final List<ReadFilter<T>> filters;

// //   /// Whether this request should overwrite existing data.
// //   final bool shouldOverwrite;

// //   /// Pagination details for this data request.
// //   final Pagination? pagination;

// //   /// Default [Pagination] details.
// //   final defaultPagination = Pagination.page(1);

// //   /// Default [RequestType].
// //   static const defaultRequestType = RequestType.global;

// //   /// Default value for [shouldOverwrite].
// //   static const defaultShouldOverwrite = true;

// //   @override
// //   List<Object?> get props => [
// //         requestType,
// //         shouldOverwrite,
// //         ...filters.map<int>((filter) => filter.hashCode),
// //         pagination,
// //       ];

// //   /// Collapses this request into a key suitable for local memory caching.
// //   /// This key should incorporate everything about this request EXCEPT the
// //   /// requestType, as that would create false-positive variance.
// //   late final int cacheKey = _getCacheKey();

// //   int _getCacheKey() =>
// //       runtimeType.hashCode ^
// //       mapPropsToHashCode([
// //         ...filters.map<int>((filter) => filter.hashCode),
// //         pagination,
// //       ]);

// //   /// Indicates whether the filters AND pagination are empty.
// //   bool get isEmpty => filters.isEmpty && pagination == null;

// //   /// Indicates whether the filters OR pagination are not empty.
// //   bool get isNotEmpty => !isEmpty;

// //   /// Copy of this RequestDetails without any filters, pagination, or other
// //   /// do-dads which would segment up a data set. This is used for saving the
// //   /// global list alongside any sliced / filtered lists.
// //   RequestDetails<T> get empty => RequestDetails<T>(requestType: requestType);

// //   @override
// //   String toString() => 'RequestDetails(requestType: $requestType, filters: '
// //       '${filters.map<String>((filter) => filter.toString()).toList()}, '
// //       'pagination: $pagination)';

// //   /// Asserts that this instane [isEmpty]. The lone string parameter is useful
// //   /// for easily seeing where this assertion was called.
// //   void assertEmpty(String functionName) {
// //     assert(isEmpty, 'Must not supply filters or pagination to $functionName');
// //   }
// // }

/// Default [RequestType].
const defaultRequestType = RequestType.global;

/// Default value for [RequestDetails.shouldOverwrite].
const defaultShouldOverwrite = true;
