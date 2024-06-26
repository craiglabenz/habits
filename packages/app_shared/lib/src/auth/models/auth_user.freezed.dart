// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return _AuthUser.fromJson(json);
}

/// @nodoc
mixin _$AuthUser {
  String get id => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;

  /// Auth mechanism used to create and restore this session. Allowed values
  /// are from [AuthType].
  AuthType get method => throw _privateConstructorUsedError;

  /// All active mechanisms used for this account. Allowed values are from
  /// [AuthType].
  List<AuthType> get allMethods => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res, AuthUser>;
  @useResult
  $Res call(
      {String id,
      String apiKey,
      AuthType method,
      List<AuthType> allMethods,
      String? email});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res, $Val extends AuthUser>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? apiKey = null,
    Object? method = null,
    Object? allMethods = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as AuthType,
      allMethods: null == allMethods
          ? _value.allMethods
          : allMethods // ignore: cast_nullable_to_non_nullable
              as List<AuthType>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserImplCopyWith<$Res>
    implements $AuthUserCopyWith<$Res> {
  factory _$$AuthUserImplCopyWith(
          _$AuthUserImpl value, $Res Function(_$AuthUserImpl) then) =
      __$$AuthUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String apiKey,
      AuthType method,
      List<AuthType> allMethods,
      String? email});
}

/// @nodoc
class __$$AuthUserImplCopyWithImpl<$Res>
    extends _$AuthUserCopyWithImpl<$Res, _$AuthUserImpl>
    implements _$$AuthUserImplCopyWith<$Res> {
  __$$AuthUserImplCopyWithImpl(
      _$AuthUserImpl _value, $Res Function(_$AuthUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? apiKey = null,
    Object? method = null,
    Object? allMethods = null,
    Object? email = freezed,
  }) {
    return _then(_$AuthUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as AuthType,
      allMethods: null == allMethods
          ? _value._allMethods
          : allMethods // ignore: cast_nullable_to_non_nullable
              as List<AuthType>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserImpl extends _AuthUser {
  const _$AuthUserImpl(
      {required this.id,
      required this.apiKey,
      required this.method,
      final List<AuthType> allMethods = const [],
      this.email})
      : _allMethods = allMethods,
        super._();

  factory _$AuthUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserImplFromJson(json);

  @override
  final String id;
  @override
  final String apiKey;

  /// Auth mechanism used to create and restore this session. Allowed values
  /// are from [AuthType].
  @override
  final AuthType method;

  /// All active mechanisms used for this account. Allowed values are from
  /// [AuthType].
  final List<AuthType> _allMethods;

  /// All active mechanisms used for this account. Allowed values are from
  /// [AuthType].
  @override
  @JsonKey()
  List<AuthType> get allMethods {
    if (_allMethods is EqualUnmodifiableListView) return _allMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allMethods);
  }

  @override
  final String? email;

  @override
  String toString() {
    return 'AuthUser(id: $id, apiKey: $apiKey, method: $method, allMethods: $allMethods, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality()
                .equals(other._allMethods, _allMethods) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, apiKey, method,
      const DeepCollectionEquality().hash(_allMethods), email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      __$$AuthUserImplCopyWithImpl<_$AuthUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserImplToJson(
      this,
    );
  }
}

abstract class _AuthUser extends AuthUser {
  const factory _AuthUser(
      {required final String id,
      required final String apiKey,
      required final AuthType method,
      final List<AuthType> allMethods,
      final String? email}) = _$AuthUserImpl;
  const _AuthUser._() : super._();

  factory _AuthUser.fromJson(Map<String, dynamic> json) =
      _$AuthUserImpl.fromJson;

  @override
  String get id;
  @override
  String get apiKey;
  @override

  /// Auth mechanism used to create and restore this session. Allowed values
  /// are from [AuthType].
  AuthType get method;
  @override

  /// All active mechanisms used for this account. Allowed values are from
  /// [AuthType].
  List<AuthType> get allMethods;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
