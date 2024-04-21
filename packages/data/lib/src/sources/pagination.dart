import 'package:common_types/common_types.dart';
import 'package:data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// {@template Pagination}
/// Page index and size information for a read request, or a write request if
/// we are caching loaded data to a local [Source].
/// {@endtemplate}
@Freezed()
class Pagination with _$Pagination {
  /// {@macro Pagination}
  const factory Pagination({
    /// Maximum number of records this data request should contain.
    @Default(defaultPageSize) int pageSize,

    /// Page number of this request. Returned data is assumed to skip
    /// "(page - 1) * pageSize" earlier records.
    @Default(0) int page,
  }) = _Pagination;

  /// Convenience constructor.
  ///
  /// {@macro Pagination}
  const factory Pagination.page(
    int page, {
    @Default(defaultPageSize) int pageSize,
  }) = _PaginationByPage;

  /// [Json] deserialization constructor for [Pagination].
  factory Pagination.fromJson(Json json) => _$PaginationFromJson(json);
}

/// Default number of records to include in a page.
const defaultPageSize = 20;
