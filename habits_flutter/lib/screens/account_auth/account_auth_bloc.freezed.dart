// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountAuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountAuthEventCopyWith<$Res> {
  factory $AccountAuthEventCopyWith(
          AccountAuthEvent value, $Res Function(AccountAuthEvent) then) =
      _$AccountAuthEventCopyWithImpl<$Res, AccountAuthEvent>;
}

/// @nodoc
class _$AccountAuthEventCopyWithImpl<$Res, $Val extends AccountAuthEvent>
    implements $AccountAuthEventCopyWith<$Res> {
  _$AccountAuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeAccountAuthImplCopyWith<$Res> {
  factory _$$InitializeAccountAuthImplCopyWith(
          _$InitializeAccountAuthImpl value,
          $Res Function(_$InitializeAccountAuthImpl) then) =
      __$$InitializeAccountAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeAccountAuthImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$InitializeAccountAuthImpl>
    implements _$$InitializeAccountAuthImplCopyWith<$Res> {
  __$$InitializeAccountAuthImplCopyWithImpl(_$InitializeAccountAuthImpl _value,
      $Res Function(_$InitializeAccountAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeAccountAuthImpl implements InitializeAccountAuth {
  const _$InitializeAccountAuthImpl();

  @override
  String toString() {
    return 'AccountAuthEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeAccountAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitializeAccountAuth implements AccountAuthEvent {
  const factory InitializeAccountAuth() = _$InitializeAccountAuthImpl;
}

/// @nodoc
abstract class _$$AddEmailAuthEventImplCopyWith<$Res> {
  factory _$$AddEmailAuthEventImplCopyWith(_$AddEmailAuthEventImpl value,
          $Res Function(_$AddEmailAuthEventImpl) then) =
      __$$AddEmailAuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddEmailAuthEventImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$AddEmailAuthEventImpl>
    implements _$$AddEmailAuthEventImplCopyWith<$Res> {
  __$$AddEmailAuthEventImplCopyWithImpl(_$AddEmailAuthEventImpl _value,
      $Res Function(_$AddEmailAuthEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddEmailAuthEventImpl implements AddEmailAuthEvent {
  const _$AddEmailAuthEventImpl();

  @override
  String toString() {
    return 'AccountAuthEvent.addEmailAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddEmailAuthEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return addEmailAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return addEmailAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (addEmailAuth != null) {
      return addEmailAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return addEmailAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return addEmailAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (addEmailAuth != null) {
      return addEmailAuth(this);
    }
    return orElse();
  }
}

abstract class AddEmailAuthEvent implements AccountAuthEvent {
  const factory AddEmailAuthEvent() = _$AddEmailAuthEventImpl;
}

/// @nodoc
abstract class _$$EmailChangedEventImplCopyWith<$Res> {
  factory _$$EmailChangedEventImplCopyWith(_$EmailChangedEventImpl value,
          $Res Function(_$EmailChangedEventImpl) then) =
      __$$EmailChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangedEventImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$EmailChangedEventImpl>
    implements _$$EmailChangedEventImplCopyWith<$Res> {
  __$$EmailChangedEventImplCopyWithImpl(_$EmailChangedEventImpl _value,
      $Res Function(_$EmailChangedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailChangedEventImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangedEventImpl implements EmailChangedEvent {
  const _$EmailChangedEventImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AccountAuthEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedEventImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedEventImplCopyWith<_$EmailChangedEventImpl> get copyWith =>
      __$$EmailChangedEventImplCopyWithImpl<_$EmailChangedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChangedEvent implements AccountAuthEvent {
  const factory EmailChangedEvent(final String email) = _$EmailChangedEventImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailChangedEventImplCopyWith<_$EmailChangedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedEventImplCopyWith<$Res> {
  factory _$$PasswordChangedEventImplCopyWith(_$PasswordChangedEventImpl value,
          $Res Function(_$PasswordChangedEventImpl) then) =
      __$$PasswordChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangedEventImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$PasswordChangedEventImpl>
    implements _$$PasswordChangedEventImplCopyWith<$Res> {
  __$$PasswordChangedEventImplCopyWithImpl(_$PasswordChangedEventImpl _value,
      $Res Function(_$PasswordChangedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChangedEventImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedEventImpl implements PasswordChangedEvent {
  const _$PasswordChangedEventImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AccountAuthEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedEventImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedEventImplCopyWith<_$PasswordChangedEventImpl>
      get copyWith =>
          __$$PasswordChangedEventImplCopyWithImpl<_$PasswordChangedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChangedEvent implements AccountAuthEvent {
  const factory PasswordChangedEvent(final String password) =
      _$PasswordChangedEventImpl;

  String get password;
  @JsonKey(ignore: true)
  _$$PasswordChangedEventImplCopyWith<_$PasswordChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveNewEmailEventImplCopyWith<$Res> {
  factory _$$SaveNewEmailEventImplCopyWith(_$SaveNewEmailEventImpl value,
          $Res Function(_$SaveNewEmailEventImpl) then) =
      __$$SaveNewEmailEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveNewEmailEventImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$SaveNewEmailEventImpl>
    implements _$$SaveNewEmailEventImplCopyWith<$Res> {
  __$$SaveNewEmailEventImplCopyWithImpl(_$SaveNewEmailEventImpl _value,
      $Res Function(_$SaveNewEmailEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveNewEmailEventImpl implements SaveNewEmailEvent {
  const _$SaveNewEmailEventImpl();

  @override
  String toString() {
    return 'AccountAuthEvent.saveNewEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveNewEmailEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return saveNewEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return saveNewEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (saveNewEmail != null) {
      return saveNewEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return saveNewEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return saveNewEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (saveNewEmail != null) {
      return saveNewEmail(this);
    }
    return orElse();
  }
}

abstract class SaveNewEmailEvent implements AccountAuthEvent {
  const factory SaveNewEmailEvent() = _$SaveNewEmailEventImpl;
}

/// @nodoc
abstract class _$$SaveNewPasswordEventImplCopyWith<$Res> {
  factory _$$SaveNewPasswordEventImplCopyWith(_$SaveNewPasswordEventImpl value,
          $Res Function(_$SaveNewPasswordEventImpl) then) =
      __$$SaveNewPasswordEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveNewPasswordEventImplCopyWithImpl<$Res>
    extends _$AccountAuthEventCopyWithImpl<$Res, _$SaveNewPasswordEventImpl>
    implements _$$SaveNewPasswordEventImplCopyWith<$Res> {
  __$$SaveNewPasswordEventImplCopyWithImpl(_$SaveNewPasswordEventImpl _value,
      $Res Function(_$SaveNewPasswordEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveNewPasswordEventImpl implements SaveNewPasswordEvent {
  const _$SaveNewPasswordEventImpl();

  @override
  String toString() {
    return 'AccountAuthEvent.saveNewPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveNewPasswordEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() addEmailAuth,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() saveNewEmail,
    required TResult Function() saveNewPassword,
  }) {
    return saveNewPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? addEmailAuth,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? saveNewEmail,
    TResult? Function()? saveNewPassword,
  }) {
    return saveNewPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? addEmailAuth,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? saveNewEmail,
    TResult Function()? saveNewPassword,
    required TResult orElse(),
  }) {
    if (saveNewPassword != null) {
      return saveNewPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAccountAuth value) init,
    required TResult Function(AddEmailAuthEvent value) addEmailAuth,
    required TResult Function(EmailChangedEvent value) emailChanged,
    required TResult Function(PasswordChangedEvent value) passwordChanged,
    required TResult Function(SaveNewEmailEvent value) saveNewEmail,
    required TResult Function(SaveNewPasswordEvent value) saveNewPassword,
  }) {
    return saveNewPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAccountAuth value)? init,
    TResult? Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult? Function(EmailChangedEvent value)? emailChanged,
    TResult? Function(PasswordChangedEvent value)? passwordChanged,
    TResult? Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult? Function(SaveNewPasswordEvent value)? saveNewPassword,
  }) {
    return saveNewPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAccountAuth value)? init,
    TResult Function(AddEmailAuthEvent value)? addEmailAuth,
    TResult Function(EmailChangedEvent value)? emailChanged,
    TResult Function(PasswordChangedEvent value)? passwordChanged,
    TResult Function(SaveNewEmailEvent value)? saveNewEmail,
    TResult Function(SaveNewPasswordEvent value)? saveNewPassword,
    required TResult orElse(),
  }) {
    if (saveNewPassword != null) {
      return saveNewPassword(this);
    }
    return orElse();
  }
}

abstract class SaveNewPasswordEvent implements AccountAuthEvent {
  const factory SaveNewPasswordEvent() = _$SaveNewPasswordEventImpl;
}

/// @nodoc
mixin _$AccountAuthState {
  AuthUser get authUser => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Not null if we just experienced a failed write to the server.
  String? get savingError => throw _privateConstructorUsedError;

  /// Contains an unsaved email address this user is registering or updating.
  String? get newEmail => throw _privateConstructorUsedError;

  /// True or false only if [newEmail] is not null. Otherwise, also null.
  InvalidValueError? get newEmailValidationError =>
      throw _privateConstructorUsedError;

  /// Contains an unsaved password this user is adding or updating.
  String? get newPassword => throw _privateConstructorUsedError;

  /// True or false only if [newPassword] is not null. Otherwise, also null.
  InvalidValueError? get newPasswordValidationError =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountAuthStateCopyWith<AccountAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountAuthStateCopyWith<$Res> {
  factory $AccountAuthStateCopyWith(
          AccountAuthState value, $Res Function(AccountAuthState) then) =
      _$AccountAuthStateCopyWithImpl<$Res, AccountAuthState>;
  @useResult
  $Res call(
      {AuthUser authUser,
      User user,
      String? savingError,
      String? newEmail,
      InvalidValueError? newEmailValidationError,
      String? newPassword,
      InvalidValueError? newPasswordValidationError});

  $AuthUserCopyWith<$Res> get authUser;
  $UserCopyWith<$Res> get user;
  $InvalidValueErrorCopyWith<$Res>? get newEmailValidationError;
  $InvalidValueErrorCopyWith<$Res>? get newPasswordValidationError;
}

/// @nodoc
class _$AccountAuthStateCopyWithImpl<$Res, $Val extends AccountAuthState>
    implements $AccountAuthStateCopyWith<$Res> {
  _$AccountAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = null,
    Object? user = null,
    Object? savingError = freezed,
    Object? newEmail = freezed,
    Object? newEmailValidationError = freezed,
    Object? newPassword = freezed,
    Object? newPasswordValidationError = freezed,
  }) {
    return _then(_value.copyWith(
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      savingError: freezed == savingError
          ? _value.savingError
          : savingError // ignore: cast_nullable_to_non_nullable
              as String?,
      newEmail: freezed == newEmail
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      newEmailValidationError: freezed == newEmailValidationError
          ? _value.newEmailValidationError
          : newEmailValidationError // ignore: cast_nullable_to_non_nullable
              as InvalidValueError?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordValidationError: freezed == newPasswordValidationError
          ? _value.newPasswordValidationError
          : newPasswordValidationError // ignore: cast_nullable_to_non_nullable
              as InvalidValueError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get authUser {
    return $AuthUserCopyWith<$Res>(_value.authUser, (value) {
      return _then(_value.copyWith(authUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvalidValueErrorCopyWith<$Res>? get newEmailValidationError {
    if (_value.newEmailValidationError == null) {
      return null;
    }

    return $InvalidValueErrorCopyWith<$Res>(_value.newEmailValidationError!,
        (value) {
      return _then(_value.copyWith(newEmailValidationError: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvalidValueErrorCopyWith<$Res>? get newPasswordValidationError {
    if (_value.newPasswordValidationError == null) {
      return null;
    }

    return $InvalidValueErrorCopyWith<$Res>(_value.newPasswordValidationError!,
        (value) {
      return _then(_value.copyWith(newPasswordValidationError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountAuthStateImplCopyWith<$Res>
    implements $AccountAuthStateCopyWith<$Res> {
  factory _$$AccountAuthStateImplCopyWith(_$AccountAuthStateImpl value,
          $Res Function(_$AccountAuthStateImpl) then) =
      __$$AccountAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthUser authUser,
      User user,
      String? savingError,
      String? newEmail,
      InvalidValueError? newEmailValidationError,
      String? newPassword,
      InvalidValueError? newPasswordValidationError});

  @override
  $AuthUserCopyWith<$Res> get authUser;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $InvalidValueErrorCopyWith<$Res>? get newEmailValidationError;
  @override
  $InvalidValueErrorCopyWith<$Res>? get newPasswordValidationError;
}

/// @nodoc
class __$$AccountAuthStateImplCopyWithImpl<$Res>
    extends _$AccountAuthStateCopyWithImpl<$Res, _$AccountAuthStateImpl>
    implements _$$AccountAuthStateImplCopyWith<$Res> {
  __$$AccountAuthStateImplCopyWithImpl(_$AccountAuthStateImpl _value,
      $Res Function(_$AccountAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = null,
    Object? user = null,
    Object? savingError = freezed,
    Object? newEmail = freezed,
    Object? newEmailValidationError = freezed,
    Object? newPassword = freezed,
    Object? newPasswordValidationError = freezed,
  }) {
    return _then(_$AccountAuthStateImpl(
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      savingError: freezed == savingError
          ? _value.savingError
          : savingError // ignore: cast_nullable_to_non_nullable
              as String?,
      newEmail: freezed == newEmail
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      newEmailValidationError: freezed == newEmailValidationError
          ? _value.newEmailValidationError
          : newEmailValidationError // ignore: cast_nullable_to_non_nullable
              as InvalidValueError?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordValidationError: freezed == newPasswordValidationError
          ? _value.newPasswordValidationError
          : newPasswordValidationError // ignore: cast_nullable_to_non_nullable
              as InvalidValueError?,
    ));
  }
}

/// @nodoc

class _$AccountAuthStateImpl extends _AccountAuthState {
  const _$AccountAuthStateImpl(
      {required this.authUser,
      required this.user,
      this.savingError,
      this.newEmail,
      this.newEmailValidationError,
      this.newPassword,
      this.newPasswordValidationError})
      : super._();

  @override
  final AuthUser authUser;
  @override
  final User user;

  /// Not null if we just experienced a failed write to the server.
  @override
  final String? savingError;

  /// Contains an unsaved email address this user is registering or updating.
  @override
  final String? newEmail;

  /// True or false only if [newEmail] is not null. Otherwise, also null.
  @override
  final InvalidValueError? newEmailValidationError;

  /// Contains an unsaved password this user is adding or updating.
  @override
  final String? newPassword;

  /// True or false only if [newPassword] is not null. Otherwise, also null.
  @override
  final InvalidValueError? newPasswordValidationError;

  @override
  String toString() {
    return 'AccountAuthState(authUser: $authUser, user: $user, savingError: $savingError, newEmail: $newEmail, newEmailValidationError: $newEmailValidationError, newPassword: $newPassword, newPasswordValidationError: $newPasswordValidationError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountAuthStateImpl &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.savingError, savingError) ||
                other.savingError == savingError) &&
            (identical(other.newEmail, newEmail) ||
                other.newEmail == newEmail) &&
            (identical(
                    other.newEmailValidationError, newEmailValidationError) ||
                other.newEmailValidationError == newEmailValidationError) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.newPasswordValidationError,
                    newPasswordValidationError) ||
                other.newPasswordValidationError ==
                    newPasswordValidationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authUser,
      user,
      savingError,
      newEmail,
      newEmailValidationError,
      newPassword,
      newPasswordValidationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountAuthStateImplCopyWith<_$AccountAuthStateImpl> get copyWith =>
      __$$AccountAuthStateImplCopyWithImpl<_$AccountAuthStateImpl>(
          this, _$identity);
}

abstract class _AccountAuthState extends AccountAuthState {
  const factory _AccountAuthState(
          {required final AuthUser authUser,
          required final User user,
          final String? savingError,
          final String? newEmail,
          final InvalidValueError? newEmailValidationError,
          final String? newPassword,
          final InvalidValueError? newPasswordValidationError}) =
      _$AccountAuthStateImpl;
  const _AccountAuthState._() : super._();

  @override
  AuthUser get authUser;
  @override
  User get user;
  @override

  /// Not null if we just experienced a failed write to the server.
  String? get savingError;
  @override

  /// Contains an unsaved email address this user is registering or updating.
  String? get newEmail;
  @override

  /// True or false only if [newEmail] is not null. Otherwise, also null.
  InvalidValueError? get newEmailValidationError;
  @override

  /// Contains an unsaved password this user is adding or updating.
  String? get newPassword;
  @override

  /// True or false only if [newPassword] is not null. Otherwise, also null.
  InvalidValueError? get newPasswordValidationError;
  @override
  @JsonKey(ignore: true)
  _$$AccountAuthStateImplCopyWith<_$AccountAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
