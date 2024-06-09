// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationError _$AuthenticationErrorFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'accountExists':
      return AccountExistsError.fromJson(json);
    case 'badEmailPassword':
      return BadEmailPasswordError.fromJson(json);
    case 'badApiKey':
      return BadApiKeyError.fromJson(json);
    case 'cancelledSocialAuth':
      return CancelledSocialAuthError.fromJson(json);
    case 'invalidPassword':
      return InvalidPasswordError.fromJson(json);
    case 'invalidCode':
      return InvalidCodeError.fromJson(json);
    case 'logoutError':
      return LogoutError.fromJson(json);
    case 'missingCredentials':
      return MissingCredentials.fromJson(json);
    case 'wrongMethod':
      return WrongMethod.fromJson(json);
    case 'unknownError':
      return UnknownAuthError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthenticationError',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthenticationError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationErrorCopyWith<$Res> {
  factory $AuthenticationErrorCopyWith(
          AuthenticationError value, $Res Function(AuthenticationError) then) =
      _$AuthenticationErrorCopyWithImpl<$Res, AuthenticationError>;
}

/// @nodoc
class _$AuthenticationErrorCopyWithImpl<$Res, $Val extends AuthenticationError>
    implements $AuthenticationErrorCopyWith<$Res> {
  _$AuthenticationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountExistsErrorImplCopyWith<$Res> {
  factory _$$AccountExistsErrorImplCopyWith(_$AccountExistsErrorImpl value,
          $Res Function(_$AccountExistsErrorImpl) then) =
      __$$AccountExistsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fieldName, String value});
}

/// @nodoc
class __$$AccountExistsErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$AccountExistsErrorImpl>
    implements _$$AccountExistsErrorImplCopyWith<$Res> {
  __$$AccountExistsErrorImplCopyWithImpl(_$AccountExistsErrorImpl _value,
      $Res Function(_$AccountExistsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? value = null,
  }) {
    return _then(_$AccountExistsErrorImpl(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountExistsErrorImpl extends AccountExistsError {
  const _$AccountExistsErrorImpl(
      {required this.fieldName, required this.value, final String? $type})
      : $type = $type ?? 'accountExists',
        super._();

  factory _$AccountExistsErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountExistsErrorImplFromJson(json);

  @override
  final String fieldName;
  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.accountExists(fieldName: $fieldName, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountExistsErrorImpl &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fieldName, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountExistsErrorImplCopyWith<_$AccountExistsErrorImpl> get copyWith =>
      __$$AccountExistsErrorImplCopyWithImpl<_$AccountExistsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return accountExists(fieldName, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return accountExists?.call(fieldName, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (accountExists != null) {
      return accountExists(fieldName, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return accountExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return accountExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (accountExists != null) {
      return accountExists(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountExistsErrorImplToJson(
      this,
    );
  }
}

abstract class AccountExistsError extends AuthenticationError {
  const factory AccountExistsError(
      {required final String fieldName,
      required final String value}) = _$AccountExistsErrorImpl;
  const AccountExistsError._() : super._();

  factory AccountExistsError.fromJson(Map<String, dynamic> json) =
      _$AccountExistsErrorImpl.fromJson;

  String get fieldName;
  String get value;
  @JsonKey(ignore: true)
  _$$AccountExistsErrorImplCopyWith<_$AccountExistsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadEmailPasswordErrorImplCopyWith<$Res> {
  factory _$$BadEmailPasswordErrorImplCopyWith(
          _$BadEmailPasswordErrorImpl value,
          $Res Function(_$BadEmailPasswordErrorImpl) then) =
      __$$BadEmailPasswordErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadEmailPasswordErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$BadEmailPasswordErrorImpl>
    implements _$$BadEmailPasswordErrorImplCopyWith<$Res> {
  __$$BadEmailPasswordErrorImplCopyWithImpl(_$BadEmailPasswordErrorImpl _value,
      $Res Function(_$BadEmailPasswordErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$BadEmailPasswordErrorImpl extends BadEmailPasswordError {
  const _$BadEmailPasswordErrorImpl({final String? $type})
      : $type = $type ?? 'badEmailPassword',
        super._();

  factory _$BadEmailPasswordErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadEmailPasswordErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.badEmailPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadEmailPasswordErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return badEmailPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return badEmailPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (badEmailPassword != null) {
      return badEmailPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return badEmailPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return badEmailPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (badEmailPassword != null) {
      return badEmailPassword(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BadEmailPasswordErrorImplToJson(
      this,
    );
  }
}

abstract class BadEmailPasswordError extends AuthenticationError {
  const factory BadEmailPasswordError() = _$BadEmailPasswordErrorImpl;
  const BadEmailPasswordError._() : super._();

  factory BadEmailPasswordError.fromJson(Map<String, dynamic> json) =
      _$BadEmailPasswordErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$BadApiKeyErrorImplCopyWith<$Res> {
  factory _$$BadApiKeyErrorImplCopyWith(_$BadApiKeyErrorImpl value,
          $Res Function(_$BadApiKeyErrorImpl) then) =
      __$$BadApiKeyErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadApiKeyErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$BadApiKeyErrorImpl>
    implements _$$BadApiKeyErrorImplCopyWith<$Res> {
  __$$BadApiKeyErrorImplCopyWithImpl(
      _$BadApiKeyErrorImpl _value, $Res Function(_$BadApiKeyErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadApiKeyErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadApiKeyErrorImpl extends BadApiKeyError {
  const _$BadApiKeyErrorImpl(this.message, {final String? $type})
      : $type = $type ?? 'badApiKey',
        super._();

  factory _$BadApiKeyErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadApiKeyErrorImplFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.badApiKey(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadApiKeyErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadApiKeyErrorImplCopyWith<_$BadApiKeyErrorImpl> get copyWith =>
      __$$BadApiKeyErrorImplCopyWithImpl<_$BadApiKeyErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return badApiKey(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return badApiKey?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (badApiKey != null) {
      return badApiKey(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return badApiKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return badApiKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (badApiKey != null) {
      return badApiKey(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BadApiKeyErrorImplToJson(
      this,
    );
  }
}

abstract class BadApiKeyError extends AuthenticationError {
  const factory BadApiKeyError(final String message) = _$BadApiKeyErrorImpl;
  const BadApiKeyError._() : super._();

  factory BadApiKeyError.fromJson(Map<String, dynamic> json) =
      _$BadApiKeyErrorImpl.fromJson;

  String get message;
  @JsonKey(ignore: true)
  _$$BadApiKeyErrorImplCopyWith<_$BadApiKeyErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledSocialAuthErrorImplCopyWith<$Res> {
  factory _$$CancelledSocialAuthErrorImplCopyWith(
          _$CancelledSocialAuthErrorImpl value,
          $Res Function(_$CancelledSocialAuthErrorImpl) then) =
      __$$CancelledSocialAuthErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledSocialAuthErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res,
        _$CancelledSocialAuthErrorImpl>
    implements _$$CancelledSocialAuthErrorImplCopyWith<$Res> {
  __$$CancelledSocialAuthErrorImplCopyWithImpl(
      _$CancelledSocialAuthErrorImpl _value,
      $Res Function(_$CancelledSocialAuthErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$CancelledSocialAuthErrorImpl extends CancelledSocialAuthError {
  const _$CancelledSocialAuthErrorImpl({final String? $type})
      : $type = $type ?? 'cancelledSocialAuth',
        super._();

  factory _$CancelledSocialAuthErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelledSocialAuthErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.cancelledSocialAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledSocialAuthErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return cancelledSocialAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return cancelledSocialAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (cancelledSocialAuth != null) {
      return cancelledSocialAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return cancelledSocialAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return cancelledSocialAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (cancelledSocialAuth != null) {
      return cancelledSocialAuth(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelledSocialAuthErrorImplToJson(
      this,
    );
  }
}

abstract class CancelledSocialAuthError extends AuthenticationError {
  const factory CancelledSocialAuthError() = _$CancelledSocialAuthErrorImpl;
  const CancelledSocialAuthError._() : super._();

  factory CancelledSocialAuthError.fromJson(Map<String, dynamic> json) =
      _$CancelledSocialAuthErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$InvalidPasswordErrorImplCopyWith<$Res> {
  factory _$$InvalidPasswordErrorImplCopyWith(_$InvalidPasswordErrorImpl value,
          $Res Function(_$InvalidPasswordErrorImpl) then) =
      __$$InvalidPasswordErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidPasswordErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$InvalidPasswordErrorImpl>
    implements _$$InvalidPasswordErrorImplCopyWith<$Res> {
  __$$InvalidPasswordErrorImplCopyWithImpl(_$InvalidPasswordErrorImpl _value,
      $Res Function(_$InvalidPasswordErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidPasswordErrorImpl extends InvalidPasswordError {
  const _$InvalidPasswordErrorImpl({final String? $type})
      : $type = $type ?? 'invalidPassword',
        super._();

  factory _$InvalidPasswordErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidPasswordErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.invalidPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPasswordErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return invalidPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidPasswordErrorImplToJson(
      this,
    );
  }
}

abstract class InvalidPasswordError extends AuthenticationError {
  const factory InvalidPasswordError() = _$InvalidPasswordErrorImpl;
  const InvalidPasswordError._() : super._();

  factory InvalidPasswordError.fromJson(Map<String, dynamic> json) =
      _$InvalidPasswordErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$InvalidCodeErrorImplCopyWith<$Res> {
  factory _$$InvalidCodeErrorImplCopyWith(_$InvalidCodeErrorImpl value,
          $Res Function(_$InvalidCodeErrorImpl) then) =
      __$$InvalidCodeErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCodeErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$InvalidCodeErrorImpl>
    implements _$$InvalidCodeErrorImplCopyWith<$Res> {
  __$$InvalidCodeErrorImplCopyWithImpl(_$InvalidCodeErrorImpl _value,
      $Res Function(_$InvalidCodeErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InvalidCodeErrorImpl extends InvalidCodeError {
  const _$InvalidCodeErrorImpl({final String? $type})
      : $type = $type ?? 'invalidCode',
        super._();

  factory _$InvalidCodeErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidCodeErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.invalidCode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidCodeErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return invalidCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return invalidCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (invalidCode != null) {
      return invalidCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return invalidCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return invalidCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidCode != null) {
      return invalidCode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidCodeErrorImplToJson(
      this,
    );
  }
}

abstract class InvalidCodeError extends AuthenticationError {
  const factory InvalidCodeError() = _$InvalidCodeErrorImpl;
  const InvalidCodeError._() : super._();

  factory InvalidCodeError.fromJson(Map<String, dynamic> json) =
      _$InvalidCodeErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$LogoutErrorImplCopyWith<$Res> {
  factory _$$LogoutErrorImplCopyWith(
          _$LogoutErrorImpl value, $Res Function(_$LogoutErrorImpl) then) =
      __$$LogoutErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$LogoutErrorImpl>
    implements _$$LogoutErrorImplCopyWith<$Res> {
  __$$LogoutErrorImplCopyWithImpl(
      _$LogoutErrorImpl _value, $Res Function(_$LogoutErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LogoutErrorImpl extends LogoutError {
  const _$LogoutErrorImpl({final String? $type})
      : $type = $type ?? 'logoutError',
        super._();

  factory _$LogoutErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoutErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.logoutError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return logoutError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return logoutError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (logoutError != null) {
      return logoutError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return logoutError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return logoutError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (logoutError != null) {
      return logoutError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoutErrorImplToJson(
      this,
    );
  }
}

abstract class LogoutError extends AuthenticationError {
  const factory LogoutError() = _$LogoutErrorImpl;
  const LogoutError._() : super._();

  factory LogoutError.fromJson(Map<String, dynamic> json) =
      _$LogoutErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$MissingCredentialsImplCopyWith<$Res> {
  factory _$$MissingCredentialsImplCopyWith(_$MissingCredentialsImpl value,
          $Res Function(_$MissingCredentialsImpl) then) =
      __$$MissingCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool missingEmail, bool missingPassword, bool missingApiKey});
}

/// @nodoc
class __$$MissingCredentialsImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$MissingCredentialsImpl>
    implements _$$MissingCredentialsImplCopyWith<$Res> {
  __$$MissingCredentialsImplCopyWithImpl(_$MissingCredentialsImpl _value,
      $Res Function(_$MissingCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingEmail = null,
    Object? missingPassword = null,
    Object? missingApiKey = null,
  }) {
    return _then(_$MissingCredentialsImpl(
      missingEmail: null == missingEmail
          ? _value.missingEmail
          : missingEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      missingPassword: null == missingPassword
          ? _value.missingPassword
          : missingPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      missingApiKey: null == missingApiKey
          ? _value.missingApiKey
          : missingApiKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissingCredentialsImpl extends MissingCredentials {
  const _$MissingCredentialsImpl(
      {required this.missingEmail,
      required this.missingPassword,
      required this.missingApiKey,
      final String? $type})
      : $type = $type ?? 'missingCredentials',
        super._();

  factory _$MissingCredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissingCredentialsImplFromJson(json);

  @override
  final bool missingEmail;
  @override
  final bool missingPassword;
  @override
  final bool missingApiKey;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.missingCredentials(missingEmail: $missingEmail, missingPassword: $missingPassword, missingApiKey: $missingApiKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingCredentialsImpl &&
            (identical(other.missingEmail, missingEmail) ||
                other.missingEmail == missingEmail) &&
            (identical(other.missingPassword, missingPassword) ||
                other.missingPassword == missingPassword) &&
            (identical(other.missingApiKey, missingApiKey) ||
                other.missingApiKey == missingApiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, missingEmail, missingPassword, missingApiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissingCredentialsImplCopyWith<_$MissingCredentialsImpl> get copyWith =>
      __$$MissingCredentialsImplCopyWithImpl<_$MissingCredentialsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return missingCredentials(missingEmail, missingPassword, missingApiKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return missingCredentials?.call(
        missingEmail, missingPassword, missingApiKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (missingCredentials != null) {
      return missingCredentials(missingEmail, missingPassword, missingApiKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return missingCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return missingCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (missingCredentials != null) {
      return missingCredentials(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MissingCredentialsImplToJson(
      this,
    );
  }
}

abstract class MissingCredentials extends AuthenticationError {
  const factory MissingCredentials(
      {required final bool missingEmail,
      required final bool missingPassword,
      required final bool missingApiKey}) = _$MissingCredentialsImpl;
  const MissingCredentials._() : super._();

  factory MissingCredentials.fromJson(Map<String, dynamic> json) =
      _$MissingCredentialsImpl.fromJson;

  bool get missingEmail;
  bool get missingPassword;
  bool get missingApiKey;
  @JsonKey(ignore: true)
  _$$MissingCredentialsImplCopyWith<_$MissingCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WrongMethodImplCopyWith<$Res> {
  factory _$$WrongMethodImplCopyWith(
          _$WrongMethodImpl value, $Res Function(_$WrongMethodImpl) then) =
      __$$WrongMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<AuthType> methods});
}

/// @nodoc
class __$$WrongMethodImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$WrongMethodImpl>
    implements _$$WrongMethodImplCopyWith<$Res> {
  __$$WrongMethodImplCopyWithImpl(
      _$WrongMethodImpl _value, $Res Function(_$WrongMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methods = null,
  }) {
    return _then(_$WrongMethodImpl(
      null == methods
          ? _value._methods
          : methods // ignore: cast_nullable_to_non_nullable
              as Set<AuthType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WrongMethodImpl extends WrongMethod {
  const _$WrongMethodImpl(final Set<AuthType> methods, {final String? $type})
      : _methods = methods,
        $type = $type ?? 'wrongMethod',
        super._();

  factory _$WrongMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$WrongMethodImplFromJson(json);

  final Set<AuthType> _methods;
  @override
  Set<AuthType> get methods {
    if (_methods is EqualUnmodifiableSetView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_methods);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.wrongMethod(methods: $methods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongMethodImpl &&
            const DeepCollectionEquality().equals(other._methods, _methods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_methods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WrongMethodImplCopyWith<_$WrongMethodImpl> get copyWith =>
      __$$WrongMethodImplCopyWithImpl<_$WrongMethodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return wrongMethod(methods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return wrongMethod?.call(methods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (wrongMethod != null) {
      return wrongMethod(methods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return wrongMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return wrongMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (wrongMethod != null) {
      return wrongMethod(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WrongMethodImplToJson(
      this,
    );
  }
}

abstract class WrongMethod extends AuthenticationError {
  const factory WrongMethod(final Set<AuthType> methods) = _$WrongMethodImpl;
  const WrongMethod._() : super._();

  factory WrongMethod.fromJson(Map<String, dynamic> json) =
      _$WrongMethodImpl.fromJson;

  Set<AuthType> get methods;
  @JsonKey(ignore: true)
  _$$WrongMethodImplCopyWith<_$WrongMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownAuthErrorImplCopyWith<$Res> {
  factory _$$UnknownAuthErrorImplCopyWith(_$UnknownAuthErrorImpl value,
          $Res Function(_$UnknownAuthErrorImpl) then) =
      __$$UnknownAuthErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownAuthErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$UnknownAuthErrorImpl>
    implements _$$UnknownAuthErrorImplCopyWith<$Res> {
  __$$UnknownAuthErrorImplCopyWithImpl(_$UnknownAuthErrorImpl _value,
      $Res Function(_$UnknownAuthErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UnknownAuthErrorImpl extends UnknownAuthError {
  const _$UnknownAuthErrorImpl({final String? $type})
      : $type = $type ?? 'unknownError',
        super._();

  factory _$UnknownAuthErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnknownAuthErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationError.unknownError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownAuthErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fieldName, String value) accountExists,
    required TResult Function() badEmailPassword,
    required TResult Function(String message) badApiKey,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)
        missingCredentials,
    required TResult Function(Set<AuthType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fieldName, String value)? accountExists,
    TResult? Function()? badEmailPassword,
    TResult? Function(String message)? badApiKey,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult? Function(Set<AuthType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fieldName, String value)? accountExists,
    TResult Function()? badEmailPassword,
    TResult Function(String message)? badApiKey,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(
            bool missingEmail, bool missingPassword, bool missingApiKey)?
        missingCredentials,
    TResult Function(Set<AuthType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountExistsError value) accountExists,
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(BadApiKeyError value) badApiKey,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountExistsError value)? accountExists,
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(BadApiKeyError value)? badApiKey,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountExistsError value)? accountExists,
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(BadApiKeyError value)? badApiKey,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnknownAuthErrorImplToJson(
      this,
    );
  }
}

abstract class UnknownAuthError extends AuthenticationError {
  const factory UnknownAuthError() = _$UnknownAuthErrorImpl;
  const UnknownAuthError._() : super._();

  factory UnknownAuthError.fromJson(Map<String, dynamic> json) =
      _$UnknownAuthErrorImpl.fromJson;
}
