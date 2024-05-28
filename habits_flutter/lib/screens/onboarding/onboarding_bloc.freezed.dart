// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  /// True if we are currently awaiting responses on any authentication
  /// requests. This is the period of time between a user tapping a button to
  /// do something, and that action resolving one way or another.
  bool get isAuthenticating => throw _privateConstructorUsedError;

  /// The user's username, to be provided on this screen. Probably their first
  /// name.
  String? get username => throw _privateConstructorUsedError;

  /// Error message to show the user if the app failed to create an anonymous
  /// session.
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({bool isAuthenticating, String? username, String? error});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? username = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuthenticating, String? username, String? error});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? username = freezed,
    Object? error = freezed,
  }) {
    return _then(_$OnboardingStateImpl(
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl extends _OnboardingState {
  const _$OnboardingStateImpl(
      {this.isAuthenticating = false, this.username, this.error})
      : super._();

  /// True if we are currently awaiting responses on any authentication
  /// requests. This is the period of time between a user tapping a button to
  /// do something, and that action resolving one way or another.
  @override
  @JsonKey()
  final bool isAuthenticating;

  /// The user's username, to be provided on this screen. Probably their first
  /// name.
  @override
  final String? username;

  /// Error message to show the user if the app failed to create an anonymous
  /// session.
  @override
  final String? error;

  @override
  String toString() {
    return 'OnboardingState(isAuthenticating: $isAuthenticating, username: $username, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                other.isAuthenticating == isAuthenticating) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isAuthenticating, username, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState extends OnboardingState {
  const factory _OnboardingState(
      {final bool isAuthenticating,
      final String? username,
      final String? error}) = _$OnboardingStateImpl;
  const _OnboardingState._() : super._();

  @override

  /// True if we are currently awaiting responses on any authentication
  /// requests. This is the period of time between a user tapping a button to
  /// do something, and that action resolving one way or another.
  bool get isAuthenticating;
  @override

  /// The user's username, to be provided on this screen. Probably their first
  /// name.
  String? get username;
  @override

  /// Error message to show the user if the app failed to create an anonymous
  /// session.
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createAccount,
    required TResult Function(String username) setUsername,
    required TResult Function() complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createAccount,
    TResult? Function(String username)? setUsername,
    TResult? Function()? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createAccount,
    TResult Function(String username)? setUsername,
    TResult Function()? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccount,
    required TResult Function(SetUsernameEvent value) setUsername,
    required TResult Function(CompleteOnboarding value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccount,
    TResult? Function(SetUsernameEvent value)? setUsername,
    TResult? Function(CompleteOnboarding value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccount,
    TResult Function(SetUsernameEvent value)? setUsername,
    TResult Function(CompleteOnboarding value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(
          OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res, OnboardingEvent>;
}

/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res, $Val extends OnboardingEvent>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateAccountEventImplCopyWith<$Res> {
  factory _$$CreateAccountEventImplCopyWith(_$CreateAccountEventImpl value,
          $Res Function(_$CreateAccountEventImpl) then) =
      __$$CreateAccountEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateAccountEventImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$CreateAccountEventImpl>
    implements _$$CreateAccountEventImplCopyWith<$Res> {
  __$$CreateAccountEventImplCopyWithImpl(_$CreateAccountEventImpl _value,
      $Res Function(_$CreateAccountEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateAccountEventImpl implements CreateAccountEvent {
  const _$CreateAccountEventImpl();

  @override
  String toString() {
    return 'OnboardingEvent.createAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateAccountEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createAccount,
    required TResult Function(String username) setUsername,
    required TResult Function() complete,
  }) {
    return createAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createAccount,
    TResult? Function(String username)? setUsername,
    TResult? Function()? complete,
  }) {
    return createAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createAccount,
    TResult Function(String username)? setUsername,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (createAccount != null) {
      return createAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccount,
    required TResult Function(SetUsernameEvent value) setUsername,
    required TResult Function(CompleteOnboarding value) complete,
  }) {
    return createAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccount,
    TResult? Function(SetUsernameEvent value)? setUsername,
    TResult? Function(CompleteOnboarding value)? complete,
  }) {
    return createAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccount,
    TResult Function(SetUsernameEvent value)? setUsername,
    TResult Function(CompleteOnboarding value)? complete,
    required TResult orElse(),
  }) {
    if (createAccount != null) {
      return createAccount(this);
    }
    return orElse();
  }
}

abstract class CreateAccountEvent implements OnboardingEvent {
  const factory CreateAccountEvent() = _$CreateAccountEventImpl;
}

/// @nodoc
abstract class _$$SetUsernameEventImplCopyWith<$Res> {
  factory _$$SetUsernameEventImplCopyWith(_$SetUsernameEventImpl value,
          $Res Function(_$SetUsernameEventImpl) then) =
      __$$SetUsernameEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$SetUsernameEventImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$SetUsernameEventImpl>
    implements _$$SetUsernameEventImplCopyWith<$Res> {
  __$$SetUsernameEventImplCopyWithImpl(_$SetUsernameEventImpl _value,
      $Res Function(_$SetUsernameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$SetUsernameEventImpl(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetUsernameEventImpl implements SetUsernameEvent {
  const _$SetUsernameEventImpl(this.username);

  @override
  final String username;

  @override
  String toString() {
    return 'OnboardingEvent.setUsername(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetUsernameEventImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetUsernameEventImplCopyWith<_$SetUsernameEventImpl> get copyWith =>
      __$$SetUsernameEventImplCopyWithImpl<_$SetUsernameEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createAccount,
    required TResult Function(String username) setUsername,
    required TResult Function() complete,
  }) {
    return setUsername(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createAccount,
    TResult? Function(String username)? setUsername,
    TResult? Function()? complete,
  }) {
    return setUsername?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createAccount,
    TResult Function(String username)? setUsername,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (setUsername != null) {
      return setUsername(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccount,
    required TResult Function(SetUsernameEvent value) setUsername,
    required TResult Function(CompleteOnboarding value) complete,
  }) {
    return setUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccount,
    TResult? Function(SetUsernameEvent value)? setUsername,
    TResult? Function(CompleteOnboarding value)? complete,
  }) {
    return setUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccount,
    TResult Function(SetUsernameEvent value)? setUsername,
    TResult Function(CompleteOnboarding value)? complete,
    required TResult orElse(),
  }) {
    if (setUsername != null) {
      return setUsername(this);
    }
    return orElse();
  }
}

abstract class SetUsernameEvent implements OnboardingEvent {
  const factory SetUsernameEvent(final String username) =
      _$SetUsernameEventImpl;

  String get username;
  @JsonKey(ignore: true)
  _$$SetUsernameEventImplCopyWith<_$SetUsernameEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteOnboardingImplCopyWith<$Res> {
  factory _$$CompleteOnboardingImplCopyWith(_$CompleteOnboardingImpl value,
          $Res Function(_$CompleteOnboardingImpl) then) =
      __$$CompleteOnboardingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompleteOnboardingImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$CompleteOnboardingImpl>
    implements _$$CompleteOnboardingImplCopyWith<$Res> {
  __$$CompleteOnboardingImplCopyWithImpl(_$CompleteOnboardingImpl _value,
      $Res Function(_$CompleteOnboardingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompleteOnboardingImpl implements CompleteOnboarding {
  const _$CompleteOnboardingImpl();

  @override
  String toString() {
    return 'OnboardingEvent.complete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompleteOnboardingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createAccount,
    required TResult Function(String username) setUsername,
    required TResult Function() complete,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createAccount,
    TResult? Function(String username)? setUsername,
    TResult? Function()? complete,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createAccount,
    TResult Function(String username)? setUsername,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateAccountEvent value) createAccount,
    required TResult Function(SetUsernameEvent value) setUsername,
    required TResult Function(CompleteOnboarding value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateAccountEvent value)? createAccount,
    TResult? Function(SetUsernameEvent value)? setUsername,
    TResult? Function(CompleteOnboarding value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateAccountEvent value)? createAccount,
    TResult Function(SetUsernameEvent value)? setUsername,
    TResult Function(CompleteOnboarding value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class CompleteOnboarding implements OnboardingEvent {
  const factory CompleteOnboarding() = _$CompleteOnboardingImpl;
}
