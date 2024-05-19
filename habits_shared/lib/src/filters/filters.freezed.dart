// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFilter _$UserFilterFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'and':
      return AndUserFilter.fromJson(json);
    case 'or':
      return OrUserFilter.fromJson(json);
    case 'uidEquals':
      return UidEqualsUserFilter.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserFilter',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserFilter {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFilter> children) and,
    required TResult Function(List<UserFilter> children) or,
    required TResult Function(String uid) uidEquals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserFilter> children)? and,
    TResult? Function(List<UserFilter> children)? or,
    TResult? Function(String uid)? uidEquals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFilter> children)? and,
    TResult Function(List<UserFilter> children)? or,
    TResult Function(String uid)? uidEquals,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndUserFilter value) and,
    required TResult Function(OrUserFilter value) or,
    required TResult Function(UidEqualsUserFilter value) uidEquals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndUserFilter value)? and,
    TResult? Function(OrUserFilter value)? or,
    TResult? Function(UidEqualsUserFilter value)? uidEquals,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndUserFilter value)? and,
    TResult Function(OrUserFilter value)? or,
    TResult Function(UidEqualsUserFilter value)? uidEquals,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFilterCopyWith<$Res> {
  factory $UserFilterCopyWith(
          UserFilter value, $Res Function(UserFilter) then) =
      _$UserFilterCopyWithImpl<$Res, UserFilter>;
}

/// @nodoc
class _$UserFilterCopyWithImpl<$Res, $Val extends UserFilter>
    implements $UserFilterCopyWith<$Res> {
  _$UserFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AndUserFilterImplCopyWith<$Res> {
  factory _$$AndUserFilterImplCopyWith(
          _$AndUserFilterImpl value, $Res Function(_$AndUserFilterImpl) then) =
      __$$AndUserFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserFilter> children});
}

/// @nodoc
class __$$AndUserFilterImplCopyWithImpl<$Res>
    extends _$UserFilterCopyWithImpl<$Res, _$AndUserFilterImpl>
    implements _$$AndUserFilterImplCopyWith<$Res> {
  __$$AndUserFilterImplCopyWithImpl(
      _$AndUserFilterImpl _value, $Res Function(_$AndUserFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$AndUserFilterImpl(
      null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<UserFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndUserFilterImpl extends AndUserFilter {
  const _$AndUserFilterImpl(final List<UserFilter> children,
      {final String? $type})
      : _children = children,
        $type = $type ?? 'and',
        super._();

  factory _$AndUserFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndUserFilterImplFromJson(json);

  final List<UserFilter> _children;
  @override
  List<UserFilter> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserFilter.and(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndUserFilterImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndUserFilterImplCopyWith<_$AndUserFilterImpl> get copyWith =>
      __$$AndUserFilterImplCopyWithImpl<_$AndUserFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFilter> children) and,
    required TResult Function(List<UserFilter> children) or,
    required TResult Function(String uid) uidEquals,
  }) {
    return and(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserFilter> children)? and,
    TResult? Function(List<UserFilter> children)? or,
    TResult? Function(String uid)? uidEquals,
  }) {
    return and?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFilter> children)? and,
    TResult Function(List<UserFilter> children)? or,
    TResult Function(String uid)? uidEquals,
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
    required TResult Function(AndUserFilter value) and,
    required TResult Function(OrUserFilter value) or,
    required TResult Function(UidEqualsUserFilter value) uidEquals,
  }) {
    return and(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndUserFilter value)? and,
    TResult? Function(OrUserFilter value)? or,
    TResult? Function(UidEqualsUserFilter value)? uidEquals,
  }) {
    return and?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndUserFilter value)? and,
    TResult Function(OrUserFilter value)? or,
    TResult Function(UidEqualsUserFilter value)? uidEquals,
    required TResult orElse(),
  }) {
    if (and != null) {
      return and(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AndUserFilterImplToJson(
      this,
    );
  }
}

abstract class AndUserFilter extends UserFilter {
  const factory AndUserFilter(final List<UserFilter> children) =
      _$AndUserFilterImpl;
  const AndUserFilter._() : super._();

  factory AndUserFilter.fromJson(Map<String, dynamic> json) =
      _$AndUserFilterImpl.fromJson;

  List<UserFilter> get children;
  @JsonKey(ignore: true)
  _$$AndUserFilterImplCopyWith<_$AndUserFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrUserFilterImplCopyWith<$Res> {
  factory _$$OrUserFilterImplCopyWith(
          _$OrUserFilterImpl value, $Res Function(_$OrUserFilterImpl) then) =
      __$$OrUserFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserFilter> children});
}

/// @nodoc
class __$$OrUserFilterImplCopyWithImpl<$Res>
    extends _$UserFilterCopyWithImpl<$Res, _$OrUserFilterImpl>
    implements _$$OrUserFilterImplCopyWith<$Res> {
  __$$OrUserFilterImplCopyWithImpl(
      _$OrUserFilterImpl _value, $Res Function(_$OrUserFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
  }) {
    return _then(_$OrUserFilterImpl(
      null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<UserFilter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrUserFilterImpl extends OrUserFilter {
  const _$OrUserFilterImpl(final List<UserFilter> children,
      {final String? $type})
      : _children = children,
        $type = $type ?? 'or',
        super._();

  factory _$OrUserFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrUserFilterImplFromJson(json);

  final List<UserFilter> _children;
  @override
  List<UserFilter> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserFilter.or(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrUserFilterImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrUserFilterImplCopyWith<_$OrUserFilterImpl> get copyWith =>
      __$$OrUserFilterImplCopyWithImpl<_$OrUserFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFilter> children) and,
    required TResult Function(List<UserFilter> children) or,
    required TResult Function(String uid) uidEquals,
  }) {
    return or(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserFilter> children)? and,
    TResult? Function(List<UserFilter> children)? or,
    TResult? Function(String uid)? uidEquals,
  }) {
    return or?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFilter> children)? and,
    TResult Function(List<UserFilter> children)? or,
    TResult Function(String uid)? uidEquals,
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
    required TResult Function(AndUserFilter value) and,
    required TResult Function(OrUserFilter value) or,
    required TResult Function(UidEqualsUserFilter value) uidEquals,
  }) {
    return or(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndUserFilter value)? and,
    TResult? Function(OrUserFilter value)? or,
    TResult? Function(UidEqualsUserFilter value)? uidEquals,
  }) {
    return or?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndUserFilter value)? and,
    TResult Function(OrUserFilter value)? or,
    TResult Function(UidEqualsUserFilter value)? uidEquals,
    required TResult orElse(),
  }) {
    if (or != null) {
      return or(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OrUserFilterImplToJson(
      this,
    );
  }
}

abstract class OrUserFilter extends UserFilter {
  const factory OrUserFilter(final List<UserFilter> children) =
      _$OrUserFilterImpl;
  const OrUserFilter._() : super._();

  factory OrUserFilter.fromJson(Map<String, dynamic> json) =
      _$OrUserFilterImpl.fromJson;

  List<UserFilter> get children;
  @JsonKey(ignore: true)
  _$$OrUserFilterImplCopyWith<_$OrUserFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UidEqualsUserFilterImplCopyWith<$Res> {
  factory _$$UidEqualsUserFilterImplCopyWith(_$UidEqualsUserFilterImpl value,
          $Res Function(_$UidEqualsUserFilterImpl) then) =
      __$$UidEqualsUserFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$UidEqualsUserFilterImplCopyWithImpl<$Res>
    extends _$UserFilterCopyWithImpl<$Res, _$UidEqualsUserFilterImpl>
    implements _$$UidEqualsUserFilterImplCopyWith<$Res> {
  __$$UidEqualsUserFilterImplCopyWithImpl(_$UidEqualsUserFilterImpl _value,
      $Res Function(_$UidEqualsUserFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$UidEqualsUserFilterImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UidEqualsUserFilterImpl extends UidEqualsUserFilter {
  const _$UidEqualsUserFilterImpl(this.uid, {final String? $type})
      : $type = $type ?? 'uidEquals',
        super._();

  factory _$UidEqualsUserFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UidEqualsUserFilterImplFromJson(json);

  @override
  final String uid;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserFilter.uidEquals(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UidEqualsUserFilterImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UidEqualsUserFilterImplCopyWith<_$UidEqualsUserFilterImpl> get copyWith =>
      __$$UidEqualsUserFilterImplCopyWithImpl<_$UidEqualsUserFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFilter> children) and,
    required TResult Function(List<UserFilter> children) or,
    required TResult Function(String uid) uidEquals,
  }) {
    return uidEquals(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserFilter> children)? and,
    TResult? Function(List<UserFilter> children)? or,
    TResult? Function(String uid)? uidEquals,
  }) {
    return uidEquals?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFilter> children)? and,
    TResult Function(List<UserFilter> children)? or,
    TResult Function(String uid)? uidEquals,
    required TResult orElse(),
  }) {
    if (uidEquals != null) {
      return uidEquals(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndUserFilter value) and,
    required TResult Function(OrUserFilter value) or,
    required TResult Function(UidEqualsUserFilter value) uidEquals,
  }) {
    return uidEquals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndUserFilter value)? and,
    TResult? Function(OrUserFilter value)? or,
    TResult? Function(UidEqualsUserFilter value)? uidEquals,
  }) {
    return uidEquals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndUserFilter value)? and,
    TResult Function(OrUserFilter value)? or,
    TResult Function(UidEqualsUserFilter value)? uidEquals,
    required TResult orElse(),
  }) {
    if (uidEquals != null) {
      return uidEquals(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UidEqualsUserFilterImplToJson(
      this,
    );
  }
}

abstract class UidEqualsUserFilter extends UserFilter {
  const factory UidEqualsUserFilter(final String uid) =
      _$UidEqualsUserFilterImpl;
  const UidEqualsUserFilter._() : super._();

  factory UidEqualsUserFilter.fromJson(Map<String, dynamic> json) =
      _$UidEqualsUserFilterImpl.fromJson;

  String get uid;
  @JsonKey(ignore: true)
  _$$UidEqualsUserFilterImplCopyWith<_$UidEqualsUserFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
