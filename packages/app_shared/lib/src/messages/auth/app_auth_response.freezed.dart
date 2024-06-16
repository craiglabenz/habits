// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppAuthResponse _$AppAuthResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return AppAuthSuccess.fromJson(json);
    case 'failure':
      return AppAuthFailure.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppAuthResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppAuthResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)
        success,
    required TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult? Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppAuthSuccess value) success,
    required TResult Function(AppAuthFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppAuthSuccess value)? success,
    TResult? Function(AppAuthFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppAuthSuccess value)? success,
    TResult Function(AppAuthFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAuthResponseCopyWith<$Res> {
  factory $AppAuthResponseCopyWith(
          AppAuthResponse value, $Res Function(AppAuthResponse) then) =
      _$AppAuthResponseCopyWithImpl<$Res, AppAuthResponse>;
}

/// @nodoc
class _$AppAuthResponseCopyWithImpl<$Res, $Val extends AppAuthResponse>
    implements $AppAuthResponseCopyWith<$Res> {
  _$AppAuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppAuthSuccessImplCopyWith<$Res> {
  factory _$$AppAuthSuccessImplCopyWith(_$AppAuthSuccessImpl value,
          $Res Function(_$AppAuthSuccessImpl) then) =
      __$$AppAuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int keyId,
      String key,
      Map<String, Object?> userInfoData,
      @AuthTypeConverter() AuthType method,
      @AuthTypeListConverter() Set<AuthType> allMethods});
}

/// @nodoc
class __$$AppAuthSuccessImplCopyWithImpl<$Res>
    extends _$AppAuthResponseCopyWithImpl<$Res, _$AppAuthSuccessImpl>
    implements _$$AppAuthSuccessImplCopyWith<$Res> {
  __$$AppAuthSuccessImplCopyWithImpl(
      _$AppAuthSuccessImpl _value, $Res Function(_$AppAuthSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyId = null,
    Object? key = null,
    Object? userInfoData = null,
    Object? method = null,
    Object? allMethods = null,
  }) {
    return _then(_$AppAuthSuccessImpl(
      keyId: null == keyId
          ? _value.keyId
          : keyId // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      userInfoData: null == userInfoData
          ? _value._userInfoData
          : userInfoData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as AuthType,
      allMethods: null == allMethods
          ? _value._allMethods
          : allMethods // ignore: cast_nullable_to_non_nullable
              as Set<AuthType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppAuthSuccessImpl extends AppAuthSuccess {
  const _$AppAuthSuccessImpl(
      {required this.keyId,
      required this.key,
      required final Map<String, Object?> userInfoData,
      @AuthTypeConverter() required this.method,
      @AuthTypeListConverter() required final Set<AuthType> allMethods,
      final String? $type})
      : _userInfoData = userInfoData,
        _allMethods = allMethods,
        $type = $type ?? 'success',
        super._();

  factory _$AppAuthSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppAuthSuccessImplFromJson(json);

  @override
  final int keyId;
  @override
  final String key;
  final Map<String, Object?> _userInfoData;
  @override
  Map<String, Object?> get userInfoData {
    if (_userInfoData is EqualUnmodifiableMapView) return _userInfoData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userInfoData);
  }

  @override
  @AuthTypeConverter()
  final AuthType method;
  final Set<AuthType> _allMethods;
  @override
  @AuthTypeListConverter()
  Set<AuthType> get allMethods {
    if (_allMethods is EqualUnmodifiableSetView) return _allMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_allMethods);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppAuthResponse.success(keyId: $keyId, key: $key, userInfoData: $userInfoData, method: $method, allMethods: $allMethods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppAuthSuccessImpl &&
            (identical(other.keyId, keyId) || other.keyId == keyId) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality()
                .equals(other._userInfoData, _userInfoData) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality()
                .equals(other._allMethods, _allMethods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      keyId,
      key,
      const DeepCollectionEquality().hash(_userInfoData),
      method,
      const DeepCollectionEquality().hash(_allMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppAuthSuccessImplCopyWith<_$AppAuthSuccessImpl> get copyWith =>
      __$$AppAuthSuccessImplCopyWithImpl<_$AppAuthSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)
        success,
    required TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)
        failure,
  }) {
    return success(keyId, key, userInfoData, method, allMethods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult? Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
  }) {
    return success?.call(keyId, key, userInfoData, method, allMethods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(keyId, key, userInfoData, method, allMethods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppAuthSuccess value) success,
    required TResult Function(AppAuthFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppAuthSuccess value)? success,
    TResult? Function(AppAuthFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppAuthSuccess value)? success,
    TResult Function(AppAuthFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppAuthSuccessImplToJson(
      this,
    );
  }
}

abstract class AppAuthSuccess extends AppAuthResponse {
  const factory AppAuthSuccess(
          {required final int keyId,
          required final String key,
          required final Map<String, Object?> userInfoData,
          @AuthTypeConverter() required final AuthType method,
          @AuthTypeListConverter() required final Set<AuthType> allMethods}) =
      _$AppAuthSuccessImpl;
  const AppAuthSuccess._() : super._();

  factory AppAuthSuccess.fromJson(Map<String, dynamic> json) =
      _$AppAuthSuccessImpl.fromJson;

  int get keyId;
  String get key;
  Map<String, Object?> get userInfoData;
  @AuthTypeConverter()
  AuthType get method;
  @AuthTypeListConverter()
  Set<AuthType> get allMethods;
  @JsonKey(ignore: true)
  _$$AppAuthSuccessImplCopyWith<_$AppAuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppAuthFailureImplCopyWith<$Res> {
  factory _$$AppAuthFailureImplCopyWith(_$AppAuthFailureImpl value,
          $Res Function(_$AppAuthFailureImpl) then) =
      __$$AppAuthFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@AuthenticationErrorConverter() AuthenticationError reason});

  $AuthenticationErrorCopyWith<$Res> get reason;
}

/// @nodoc
class __$$AppAuthFailureImplCopyWithImpl<$Res>
    extends _$AppAuthResponseCopyWithImpl<$Res, _$AppAuthFailureImpl>
    implements _$$AppAuthFailureImplCopyWith<$Res> {
  __$$AppAuthFailureImplCopyWithImpl(
      _$AppAuthFailureImpl _value, $Res Function(_$AppAuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$AppAuthFailureImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as AuthenticationError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticationErrorCopyWith<$Res> get reason {
    return $AuthenticationErrorCopyWith<$Res>(_value.reason, (value) {
      return _then(_value.copyWith(reason: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$AppAuthFailureImpl extends AppAuthFailure {
  const _$AppAuthFailureImpl(
      {@AuthenticationErrorConverter() required this.reason,
      final String? $type})
      : $type = $type ?? 'failure',
        super._();

  factory _$AppAuthFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppAuthFailureImplFromJson(json);

  @override
  @AuthenticationErrorConverter()
  final AuthenticationError reason;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppAuthResponse.failure(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppAuthFailureImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppAuthFailureImplCopyWith<_$AppAuthFailureImpl> get copyWith =>
      __$$AppAuthFailureImplCopyWithImpl<_$AppAuthFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)
        success,
    required TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)
        failure,
  }) {
    return failure(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult? Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
  }) {
    return failure?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int keyId,
            String key,
            Map<String, Object?> userInfoData,
            @AuthTypeConverter() AuthType method,
            @AuthTypeListConverter() Set<AuthType> allMethods)?
        success,
    TResult Function(
            @AuthenticationErrorConverter() AuthenticationError reason)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppAuthSuccess value) success,
    required TResult Function(AppAuthFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppAuthSuccess value)? success,
    TResult? Function(AppAuthFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppAuthSuccess value)? success,
    TResult Function(AppAuthFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppAuthFailureImplToJson(
      this,
    );
  }
}

abstract class AppAuthFailure extends AppAuthResponse {
  const factory AppAuthFailure(
      {@AuthenticationErrorConverter()
      required final AuthenticationError reason}) = _$AppAuthFailureImpl;
  const AppAuthFailure._() : super._();

  factory AppAuthFailure.fromJson(Map<String, dynamic> json) =
      _$AppAuthFailureImpl.fromJson;

  @AuthenticationErrorConverter()
  AuthenticationError get reason;
  @JsonKey(ignore: true)
  _$$AppAuthFailureImplCopyWith<_$AppAuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
