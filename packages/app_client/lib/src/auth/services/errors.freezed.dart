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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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

class _$BadEmailPasswordErrorImpl extends BadEmailPasswordError {
  const _$BadEmailPasswordErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.badEmailPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadEmailPasswordErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return badEmailPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return badEmailPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class BadEmailPasswordError extends AuthenticationError {
  const factory BadEmailPasswordError() = _$BadEmailPasswordErrorImpl;
  const BadEmailPasswordError._() : super._();
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

class _$CancelledSocialAuthErrorImpl extends CancelledSocialAuthError {
  const _$CancelledSocialAuthErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.cancelledSocialAuth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledSocialAuthErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return cancelledSocialAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return cancelledSocialAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class CancelledSocialAuthError extends AuthenticationError {
  const factory CancelledSocialAuthError() = _$CancelledSocialAuthErrorImpl;
  const CancelledSocialAuthError._() : super._();
}

/// @nodoc
abstract class _$$EmailTakenErrorImplCopyWith<$Res> {
  factory _$$EmailTakenErrorImplCopyWith(_$EmailTakenErrorImpl value,
          $Res Function(_$EmailTakenErrorImpl) then) =
      __$$EmailTakenErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailTakenErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationErrorCopyWithImpl<$Res, _$EmailTakenErrorImpl>
    implements _$$EmailTakenErrorImplCopyWith<$Res> {
  __$$EmailTakenErrorImplCopyWithImpl(
      _$EmailTakenErrorImpl _value, $Res Function(_$EmailTakenErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailTakenErrorImpl extends EmailTakenError {
  const _$EmailTakenErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.emailTaken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailTakenErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return emailTaken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return emailTaken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (emailTaken != null) {
      return emailTaken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
    required TResult Function(InvalidPasswordError value) invalidPassword,
    required TResult Function(InvalidCodeError value) invalidCode,
    required TResult Function(LogoutError value) logoutError,
    required TResult Function(MissingCredentials value) missingCredentials,
    required TResult Function(WrongMethod value) wrongMethod,
    required TResult Function(UnknownAuthError value) unknownError,
  }) {
    return emailTaken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
    TResult? Function(InvalidPasswordError value)? invalidPassword,
    TResult? Function(InvalidCodeError value)? invalidCode,
    TResult? Function(LogoutError value)? logoutError,
    TResult? Function(MissingCredentials value)? missingCredentials,
    TResult? Function(WrongMethod value)? wrongMethod,
    TResult? Function(UnknownAuthError value)? unknownError,
  }) {
    return emailTaken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
    TResult Function(InvalidPasswordError value)? invalidPassword,
    TResult Function(InvalidCodeError value)? invalidCode,
    TResult Function(LogoutError value)? logoutError,
    TResult Function(MissingCredentials value)? missingCredentials,
    TResult Function(WrongMethod value)? wrongMethod,
    TResult Function(UnknownAuthError value)? unknownError,
    required TResult orElse(),
  }) {
    if (emailTaken != null) {
      return emailTaken(this);
    }
    return orElse();
  }
}

abstract class EmailTakenError extends AuthenticationError {
  const factory EmailTakenError() = _$EmailTakenErrorImpl;
  const EmailTakenError._() : super._();
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

class _$InvalidPasswordErrorImpl extends InvalidPasswordError {
  const _$InvalidPasswordErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.invalidPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPasswordErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return invalidPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class InvalidPasswordError extends AuthenticationError {
  const factory InvalidPasswordError() = _$InvalidPasswordErrorImpl;
  const InvalidPasswordError._() : super._();
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

class _$InvalidCodeErrorImpl extends InvalidCodeError {
  const _$InvalidCodeErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.invalidCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidCodeErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return invalidCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return invalidCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class InvalidCodeError extends AuthenticationError {
  const factory InvalidCodeError() = _$InvalidCodeErrorImpl;
  const InvalidCodeError._() : super._();
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

class _$LogoutErrorImpl extends LogoutError {
  const _$LogoutErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.logoutError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return logoutError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return logoutError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class LogoutError extends AuthenticationError {
  const factory LogoutError() = _$LogoutErrorImpl;
  const LogoutError._() : super._();
}

/// @nodoc
abstract class _$$MissingCredentialsImplCopyWith<$Res> {
  factory _$$MissingCredentialsImplCopyWith(_$MissingCredentialsImpl value,
          $Res Function(_$MissingCredentialsImpl) then) =
      __$$MissingCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool missingEmail, bool missingPassword});
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
    ));
  }
}

/// @nodoc

class _$MissingCredentialsImpl extends MissingCredentials {
  const _$MissingCredentialsImpl(
      {required this.missingEmail, required this.missingPassword})
      : super._();

  @override
  final bool missingEmail;
  @override
  final bool missingPassword;

  @override
  String toString() {
    return 'AuthenticationError.missingCredentials(missingEmail: $missingEmail, missingPassword: $missingPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingCredentialsImpl &&
            (identical(other.missingEmail, missingEmail) ||
                other.missingEmail == missingEmail) &&
            (identical(other.missingPassword, missingPassword) ||
                other.missingPassword == missingPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, missingEmail, missingPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissingCredentialsImplCopyWith<_$MissingCredentialsImpl> get copyWith =>
      __$$MissingCredentialsImplCopyWithImpl<_$MissingCredentialsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return missingCredentials(missingEmail, missingPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return missingCredentials?.call(missingEmail, missingPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (missingCredentials != null) {
      return missingCredentials(missingEmail, missingPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class MissingCredentials extends AuthenticationError {
  const factory MissingCredentials(
      {required final bool missingEmail,
      required final bool missingPassword}) = _$MissingCredentialsImpl;
  const MissingCredentials._() : super._();

  bool get missingEmail;
  bool get missingPassword;
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
  $Res call({Set<LoginType> methods});
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
              as Set<LoginType>,
    ));
  }
}

/// @nodoc

class _$WrongMethodImpl extends WrongMethod {
  const _$WrongMethodImpl(final Set<LoginType> methods)
      : _methods = methods,
        super._();

  final Set<LoginType> _methods;
  @override
  Set<LoginType> get methods {
    if (_methods is EqualUnmodifiableSetView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_methods);
  }

  @override
  String toString() {
    return 'AuthenticationError.wrongMethod(methods: $methods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongMethodImpl &&
            const DeepCollectionEquality().equals(other._methods, _methods));
  }

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
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return wrongMethod(methods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return wrongMethod?.call(methods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class WrongMethod extends AuthenticationError {
  const factory WrongMethod(final Set<LoginType> methods) = _$WrongMethodImpl;
  const WrongMethod._() : super._();

  Set<LoginType> get methods;
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

class _$UnknownAuthErrorImpl extends UnknownAuthError {
  const _$UnknownAuthErrorImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationError.unknownError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownAuthErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() badEmailPassword,
    required TResult Function() cancelledSocialAuth,
    required TResult Function() emailTaken,
    required TResult Function() invalidPassword,
    required TResult Function() invalidCode,
    required TResult Function() logoutError,
    required TResult Function(bool missingEmail, bool missingPassword)
        missingCredentials,
    required TResult Function(Set<LoginType> methods) wrongMethod,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? badEmailPassword,
    TResult? Function()? cancelledSocialAuth,
    TResult? Function()? emailTaken,
    TResult? Function()? invalidPassword,
    TResult? Function()? invalidCode,
    TResult? Function()? logoutError,
    TResult? Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult? Function(Set<LoginType> methods)? wrongMethod,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? badEmailPassword,
    TResult Function()? cancelledSocialAuth,
    TResult Function()? emailTaken,
    TResult Function()? invalidPassword,
    TResult Function()? invalidCode,
    TResult Function()? logoutError,
    TResult Function(bool missingEmail, bool missingPassword)?
        missingCredentials,
    TResult Function(Set<LoginType> methods)? wrongMethod,
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
    required TResult Function(BadEmailPasswordError value) badEmailPassword,
    required TResult Function(CancelledSocialAuthError value)
        cancelledSocialAuth,
    required TResult Function(EmailTakenError value) emailTaken,
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
    TResult? Function(BadEmailPasswordError value)? badEmailPassword,
    TResult? Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult? Function(EmailTakenError value)? emailTaken,
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
    TResult Function(BadEmailPasswordError value)? badEmailPassword,
    TResult Function(CancelledSocialAuthError value)? cancelledSocialAuth,
    TResult Function(EmailTakenError value)? emailTaken,
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
}

abstract class UnknownAuthError extends AuthenticationError {
  const factory UnknownAuthError() = _$UnknownAuthErrorImpl;
  const UnknownAuthError._() : super._();
}
