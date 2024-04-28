// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _Pagination.fromJson(json);
    case 'page':
      return _PaginationByPage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Pagination',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Pagination {
  /// Maximum number of records this data request should contain.
  int get pageSize => throw _privateConstructorUsedError;

  /// Page number of this request. Returned data is assumed to skip
  /// "(page - 1) * pageSize" earlier records.
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int pageSize, int page) $default, {
    required TResult Function(int page, int pageSize) page,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int pageSize, int page)? $default, {
    TResult? Function(int page, int pageSize)? page,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int pageSize, int page)? $default, {
    TResult Function(int page, int pageSize)? page,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Pagination value) $default, {
    required TResult Function(_PaginationByPage value) page,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Pagination value)? $default, {
    TResult? Function(_PaginationByPage value)? page,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Pagination value)? $default, {
    TResult Function(_PaginationByPage value)? page,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call({int pageSize, int page});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageSize, int page});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_$PaginationImpl(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {this.pageSize = defaultPageSize, this.page = 0, final String? $type})
      : $type = $type ?? 'default';

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  /// Maximum number of records this data request should contain.
  @override
  @JsonKey()
  final int pageSize;

  /// Page number of this request. Returned data is assumed to skip
  /// "(page - 1) * pageSize" earlier records.
  @override
  @JsonKey()
  final int page;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Pagination(pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int pageSize, int page) $default, {
    required TResult Function(int page, int pageSize) page,
  }) {
    return $default(pageSize, this.page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int pageSize, int page)? $default, {
    TResult? Function(int page, int pageSize)? page,
  }) {
    return $default?.call(pageSize, this.page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int pageSize, int page)? $default, {
    TResult Function(int page, int pageSize)? page,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(pageSize, this.page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Pagination value) $default, {
    required TResult Function(_PaginationByPage value) page,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Pagination value)? $default, {
    TResult? Function(_PaginationByPage value)? page,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Pagination value)? $default, {
    TResult Function(_PaginationByPage value)? page,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination({final int pageSize, final int page}) =
      _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override

  /// Maximum number of records this data request should contain.
  int get pageSize;
  @override

  /// Page number of this request. Returned data is assumed to skip
  /// "(page - 1) * pageSize" earlier records.
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaginationByPageImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationByPageImplCopyWith(_$PaginationByPageImpl value,
          $Res Function(_$PaginationByPageImpl) then) =
      __$$PaginationByPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pageSize});
}

/// @nodoc
class __$$PaginationByPageImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationByPageImpl>
    implements _$$PaginationByPageImplCopyWith<$Res> {
  __$$PaginationByPageImplCopyWithImpl(_$PaginationByPageImpl _value,
      $Res Function(_$PaginationByPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$PaginationByPageImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationByPageImpl implements _PaginationByPage {
  const _$PaginationByPageImpl(this.page,
      {this.pageSize = defaultPageSize, final String? $type})
      : $type = $type ?? 'page';

  factory _$PaginationByPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationByPageImplFromJson(json);

  @override
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Pagination.page(page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationByPageImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationByPageImplCopyWith<_$PaginationByPageImpl> get copyWith =>
      __$$PaginationByPageImplCopyWithImpl<_$PaginationByPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int pageSize, int page) $default, {
    required TResult Function(int page, int pageSize) page,
  }) {
    return page(this.page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int pageSize, int page)? $default, {
    TResult? Function(int page, int pageSize)? page,
  }) {
    return page?.call(this.page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int pageSize, int page)? $default, {
    TResult Function(int page, int pageSize)? page,
    required TResult orElse(),
  }) {
    if (page != null) {
      return page(this.page, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Pagination value) $default, {
    required TResult Function(_PaginationByPage value) page,
  }) {
    return page(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Pagination value)? $default, {
    TResult? Function(_PaginationByPage value)? page,
  }) {
    return page?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Pagination value)? $default, {
    TResult Function(_PaginationByPage value)? page,
    required TResult orElse(),
  }) {
    if (page != null) {
      return page(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationByPageImplToJson(
      this,
    );
  }
}

abstract class _PaginationByPage implements Pagination {
  const factory _PaginationByPage(final int page, {final int pageSize}) =
      _$PaginationByPageImpl;

  factory _PaginationByPage.fromJson(Map<String, dynamic> json) =
      _$PaginationByPageImpl.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$PaginationByPageImplCopyWith<_$PaginationByPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
