// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostFilter _$PostFilterFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'and':
      return AndPostFilter.fromJson(json);
    case 'or':
      return OrPostFilter.fromJson(json);
    case 'createdAfter':
      return PostFilterCreatedAfter.fromJson(json);
    case 'createdBefore':
      return PostFilterCreatedBefore.fromJson(json);
    case 'bodyContains':
      return PostFilterBodyContains.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PostFilter',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PostFilter {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFilterCopyWith<$Res> {
  factory $PostFilterCopyWith(
          PostFilter value, $Res Function(PostFilter) then) =
      _$PostFilterCopyWithImpl<$Res, PostFilter>;
}

/// @nodoc
class _$PostFilterCopyWithImpl<$Res, $Val extends PostFilter>
    implements $PostFilterCopyWith<$Res> {
  _$PostFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AndPostFilterImplCopyWith<$Res> {
  factory _$$AndPostFilterImplCopyWith(
          _$AndPostFilterImpl value, $Res Function(_$AndPostFilterImpl) then) =
      __$$AndPostFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PostFilter> children});
}

/// @nodoc
class __$$AndPostFilterImplCopyWithImpl<$Res>
    extends _$PostFilterCopyWithImpl<$Res, _$AndPostFilterImpl>
    implements _$$AndPostFilterImplCopyWith<$Res> {
  __$$AndPostFilterImplCopyWithImpl(
      _$AndPostFilterImpl _value, $Res Function(_$AndPostFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$AndPostFilterImpl(
      null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<PostFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndPostFilterImpl extends AndPostFilter {
  const _$AndPostFilterImpl(final List<PostFilter> children,
      {final String? $type})
      : _children = children,
        $type = $type ?? 'and',
        super._();

  factory _$AndPostFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndPostFilterImplFromJson(json);

  final List<PostFilter> _children;
  @override
  List<PostFilter> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostFilter.and(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndPostFilterImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndPostFilterImplCopyWith<_$AndPostFilterImpl> get copyWith =>
      __$$AndPostFilterImplCopyWithImpl<_$AndPostFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) {
    return and(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) {
    return and?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) {
    if (and != null) {
      return and(children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) {
    return and(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) {
    return and?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) {
    if (and != null) {
      return and(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AndPostFilterImplToJson(
      this,
    );
  }
}

abstract class AndPostFilter extends PostFilter {
  const factory AndPostFilter(final List<PostFilter> children) =
      _$AndPostFilterImpl;
  const AndPostFilter._() : super._();

  factory AndPostFilter.fromJson(Map<String, dynamic> json) =
      _$AndPostFilterImpl.fromJson;

  List<PostFilter> get children;
  @JsonKey(ignore: true)
  _$$AndPostFilterImplCopyWith<_$AndPostFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrPostFilterImplCopyWith<$Res> {
  factory _$$OrPostFilterImplCopyWith(
          _$OrPostFilterImpl value, $Res Function(_$OrPostFilterImpl) then) =
      __$$OrPostFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PostFilter> children});
}

/// @nodoc
class __$$OrPostFilterImplCopyWithImpl<$Res>
    extends _$PostFilterCopyWithImpl<$Res, _$OrPostFilterImpl>
    implements _$$OrPostFilterImplCopyWith<$Res> {
  __$$OrPostFilterImplCopyWithImpl(
      _$OrPostFilterImpl _value, $Res Function(_$OrPostFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$OrPostFilterImpl(
      null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<PostFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrPostFilterImpl extends OrPostFilter {
  const _$OrPostFilterImpl(final List<PostFilter> children,
      {final String? $type})
      : _children = children,
        $type = $type ?? 'or',
        super._();

  factory _$OrPostFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrPostFilterImplFromJson(json);

  final List<PostFilter> _children;
  @override
  List<PostFilter> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostFilter.or(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrPostFilterImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrPostFilterImplCopyWith<_$OrPostFilterImpl> get copyWith =>
      __$$OrPostFilterImplCopyWithImpl<_$OrPostFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) {
    return or(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) {
    return or?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) {
    if (or != null) {
      return or(children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) {
    return or(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) {
    return or?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) {
    if (or != null) {
      return or(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OrPostFilterImplToJson(
      this,
    );
  }
}

abstract class OrPostFilter extends PostFilter {
  const factory OrPostFilter(final List<PostFilter> children) =
      _$OrPostFilterImpl;
  const OrPostFilter._() : super._();

  factory OrPostFilter.fromJson(Map<String, dynamic> json) =
      _$OrPostFilterImpl.fromJson;

  List<PostFilter> get children;
  @JsonKey(ignore: true)
  _$$OrPostFilterImplCopyWith<_$OrPostFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFilterCreatedAfterImplCopyWith<$Res> {
  factory _$$PostFilterCreatedAfterImplCopyWith(
          _$PostFilterCreatedAfterImpl value,
          $Res Function(_$PostFilterCreatedAfterImpl) then) =
      __$$PostFilterCreatedAfterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime value});
}

/// @nodoc
class __$$PostFilterCreatedAfterImplCopyWithImpl<$Res>
    extends _$PostFilterCopyWithImpl<$Res, _$PostFilterCreatedAfterImpl>
    implements _$$PostFilterCreatedAfterImplCopyWith<$Res> {
  __$$PostFilterCreatedAfterImplCopyWithImpl(
      _$PostFilterCreatedAfterImpl _value,
      $Res Function(_$PostFilterCreatedAfterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$PostFilterCreatedAfterImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostFilterCreatedAfterImpl extends PostFilterCreatedAfter {
  const _$PostFilterCreatedAfterImpl(this.value, {final String? $type})
      : $type = $type ?? 'createdAfter',
        super._();

  factory _$PostFilterCreatedAfterImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostFilterCreatedAfterImplFromJson(json);

  @override
  final DateTime value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostFilter.createdAfter(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFilterCreatedAfterImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFilterCreatedAfterImplCopyWith<_$PostFilterCreatedAfterImpl>
      get copyWith => __$$PostFilterCreatedAfterImplCopyWithImpl<
          _$PostFilterCreatedAfterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) {
    return createdAfter(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) {
    return createdAfter?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) {
    if (createdAfter != null) {
      return createdAfter(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) {
    return createdAfter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) {
    return createdAfter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) {
    if (createdAfter != null) {
      return createdAfter(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PostFilterCreatedAfterImplToJson(
      this,
    );
  }
}

abstract class PostFilterCreatedAfter extends PostFilter {
  const factory PostFilterCreatedAfter(final DateTime value) =
      _$PostFilterCreatedAfterImpl;
  const PostFilterCreatedAfter._() : super._();

  factory PostFilterCreatedAfter.fromJson(Map<String, dynamic> json) =
      _$PostFilterCreatedAfterImpl.fromJson;

  DateTime get value;
  @JsonKey(ignore: true)
  _$$PostFilterCreatedAfterImplCopyWith<_$PostFilterCreatedAfterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFilterCreatedBeforeImplCopyWith<$Res> {
  factory _$$PostFilterCreatedBeforeImplCopyWith(
          _$PostFilterCreatedBeforeImpl value,
          $Res Function(_$PostFilterCreatedBeforeImpl) then) =
      __$$PostFilterCreatedBeforeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime value});
}

/// @nodoc
class __$$PostFilterCreatedBeforeImplCopyWithImpl<$Res>
    extends _$PostFilterCopyWithImpl<$Res, _$PostFilterCreatedBeforeImpl>
    implements _$$PostFilterCreatedBeforeImplCopyWith<$Res> {
  __$$PostFilterCreatedBeforeImplCopyWithImpl(
      _$PostFilterCreatedBeforeImpl _value,
      $Res Function(_$PostFilterCreatedBeforeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$PostFilterCreatedBeforeImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostFilterCreatedBeforeImpl extends PostFilterCreatedBefore {
  const _$PostFilterCreatedBeforeImpl(this.value, {final String? $type})
      : $type = $type ?? 'createdBefore',
        super._();

  factory _$PostFilterCreatedBeforeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostFilterCreatedBeforeImplFromJson(json);

  @override
  final DateTime value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostFilter.createdBefore(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFilterCreatedBeforeImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFilterCreatedBeforeImplCopyWith<_$PostFilterCreatedBeforeImpl>
      get copyWith => __$$PostFilterCreatedBeforeImplCopyWithImpl<
          _$PostFilterCreatedBeforeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) {
    return createdBefore(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) {
    return createdBefore?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) {
    if (createdBefore != null) {
      return createdBefore(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) {
    return createdBefore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) {
    return createdBefore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) {
    if (createdBefore != null) {
      return createdBefore(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PostFilterCreatedBeforeImplToJson(
      this,
    );
  }
}

abstract class PostFilterCreatedBefore extends PostFilter {
  const factory PostFilterCreatedBefore(final DateTime value) =
      _$PostFilterCreatedBeforeImpl;
  const PostFilterCreatedBefore._() : super._();

  factory PostFilterCreatedBefore.fromJson(Map<String, dynamic> json) =
      _$PostFilterCreatedBeforeImpl.fromJson;

  DateTime get value;
  @JsonKey(ignore: true)
  _$$PostFilterCreatedBeforeImplCopyWith<_$PostFilterCreatedBeforeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFilterBodyContainsImplCopyWith<$Res> {
  factory _$$PostFilterBodyContainsImplCopyWith(
          _$PostFilterBodyContainsImpl value,
          $Res Function(_$PostFilterBodyContainsImpl) then) =
      __$$PostFilterBodyContainsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$PostFilterBodyContainsImplCopyWithImpl<$Res>
    extends _$PostFilterCopyWithImpl<$Res, _$PostFilterBodyContainsImpl>
    implements _$$PostFilterBodyContainsImplCopyWith<$Res> {
  __$$PostFilterBodyContainsImplCopyWithImpl(
      _$PostFilterBodyContainsImpl _value,
      $Res Function(_$PostFilterBodyContainsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$PostFilterBodyContainsImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostFilterBodyContainsImpl extends PostFilterBodyContains {
  const _$PostFilterBodyContainsImpl(this.value, {final String? $type})
      : $type = $type ?? 'bodyContains',
        super._();

  factory _$PostFilterBodyContainsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostFilterBodyContainsImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostFilter.bodyContains(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFilterBodyContainsImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFilterBodyContainsImplCopyWith<_$PostFilterBodyContainsImpl>
      get copyWith => __$$PostFilterBodyContainsImplCopyWithImpl<
          _$PostFilterBodyContainsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PostFilter> children) and,
    required TResult Function(List<PostFilter> children) or,
    required TResult Function(DateTime value) createdAfter,
    required TResult Function(DateTime value) createdBefore,
    required TResult Function(String value) bodyContains,
  }) {
    return bodyContains(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PostFilter> children)? and,
    TResult? Function(List<PostFilter> children)? or,
    TResult? Function(DateTime value)? createdAfter,
    TResult? Function(DateTime value)? createdBefore,
    TResult? Function(String value)? bodyContains,
  }) {
    return bodyContains?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PostFilter> children)? and,
    TResult Function(List<PostFilter> children)? or,
    TResult Function(DateTime value)? createdAfter,
    TResult Function(DateTime value)? createdBefore,
    TResult Function(String value)? bodyContains,
    required TResult orElse(),
  }) {
    if (bodyContains != null) {
      return bodyContains(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndPostFilter value) and,
    required TResult Function(OrPostFilter value) or,
    required TResult Function(PostFilterCreatedAfter value) createdAfter,
    required TResult Function(PostFilterCreatedBefore value) createdBefore,
    required TResult Function(PostFilterBodyContains value) bodyContains,
  }) {
    return bodyContains(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndPostFilter value)? and,
    TResult? Function(OrPostFilter value)? or,
    TResult? Function(PostFilterCreatedAfter value)? createdAfter,
    TResult? Function(PostFilterCreatedBefore value)? createdBefore,
    TResult? Function(PostFilterBodyContains value)? bodyContains,
  }) {
    return bodyContains?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndPostFilter value)? and,
    TResult Function(OrPostFilter value)? or,
    TResult Function(PostFilterCreatedAfter value)? createdAfter,
    TResult Function(PostFilterCreatedBefore value)? createdBefore,
    TResult Function(PostFilterBodyContains value)? bodyContains,
    required TResult orElse(),
  }) {
    if (bodyContains != null) {
      return bodyContains(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PostFilterBodyContainsImplToJson(
      this,
    );
  }
}

abstract class PostFilterBodyContains extends PostFilter {
  const factory PostFilterBodyContains(final String value) =
      _$PostFilterBodyContainsImpl;
  const PostFilterBodyContains._() : super._();

  factory PostFilterBodyContains.fromJson(Map<String, dynamic> json) =
      _$PostFilterBodyContainsImpl.fromJson;

  String get value;
  @JsonKey(ignore: true)
  _$$PostFilterBodyContainsImplCopyWith<_$PostFilterBodyContainsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
