// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_drawer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountDrawerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Timezone? timezone) setTimezone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Timezone? timezone)? setTimezone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Timezone? timezone)? setTimezone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEvent value) initialize,
    required TResult Function(SetTimezoneEvent value) setTimezone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeEvent value)? initialize,
    TResult? Function(SetTimezoneEvent value)? setTimezone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEvent value)? initialize,
    TResult Function(SetTimezoneEvent value)? setTimezone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDrawerEventCopyWith<$Res> {
  factory $AccountDrawerEventCopyWith(
          AccountDrawerEvent value, $Res Function(AccountDrawerEvent) then) =
      _$AccountDrawerEventCopyWithImpl<$Res, AccountDrawerEvent>;
}

/// @nodoc
class _$AccountDrawerEventCopyWithImpl<$Res, $Val extends AccountDrawerEvent>
    implements $AccountDrawerEventCopyWith<$Res> {
  _$AccountDrawerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeEventImplCopyWith<$Res> {
  factory _$$InitializeEventImplCopyWith(_$InitializeEventImpl value,
          $Res Function(_$InitializeEventImpl) then) =
      __$$InitializeEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeEventImplCopyWithImpl<$Res>
    extends _$AccountDrawerEventCopyWithImpl<$Res, _$InitializeEventImpl>
    implements _$$InitializeEventImplCopyWith<$Res> {
  __$$InitializeEventImplCopyWithImpl(
      _$InitializeEventImpl _value, $Res Function(_$InitializeEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeEventImpl implements InitializeEvent {
  const _$InitializeEventImpl();

  @override
  String toString() {
    return 'AccountDrawerEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Timezone? timezone) setTimezone,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Timezone? timezone)? setTimezone,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Timezone? timezone)? setTimezone,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEvent value) initialize,
    required TResult Function(SetTimezoneEvent value) setTimezone,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeEvent value)? initialize,
    TResult? Function(SetTimezoneEvent value)? setTimezone,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEvent value)? initialize,
    TResult Function(SetTimezoneEvent value)? setTimezone,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class InitializeEvent implements AccountDrawerEvent {
  const factory InitializeEvent() = _$InitializeEventImpl;
}

/// @nodoc
abstract class _$$SetTimezoneEventImplCopyWith<$Res> {
  factory _$$SetTimezoneEventImplCopyWith(_$SetTimezoneEventImpl value,
          $Res Function(_$SetTimezoneEventImpl) then) =
      __$$SetTimezoneEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Timezone? timezone});
}

/// @nodoc
class __$$SetTimezoneEventImplCopyWithImpl<$Res>
    extends _$AccountDrawerEventCopyWithImpl<$Res, _$SetTimezoneEventImpl>
    implements _$$SetTimezoneEventImplCopyWith<$Res> {
  __$$SetTimezoneEventImplCopyWithImpl(_$SetTimezoneEventImpl _value,
      $Res Function(_$SetTimezoneEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = freezed,
  }) {
    return _then(_$SetTimezoneEventImpl(
      freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Timezone?,
    ));
  }
}

/// @nodoc

class _$SetTimezoneEventImpl implements SetTimezoneEvent {
  const _$SetTimezoneEventImpl(this.timezone);

  @override
  final Timezone? timezone;

  @override
  String toString() {
    return 'AccountDrawerEvent.setTimezone(timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTimezoneEventImpl &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTimezoneEventImplCopyWith<_$SetTimezoneEventImpl> get copyWith =>
      __$$SetTimezoneEventImplCopyWithImpl<_$SetTimezoneEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Timezone? timezone) setTimezone,
  }) {
    return setTimezone(timezone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Timezone? timezone)? setTimezone,
  }) {
    return setTimezone?.call(timezone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Timezone? timezone)? setTimezone,
    required TResult orElse(),
  }) {
    if (setTimezone != null) {
      return setTimezone(timezone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEvent value) initialize,
    required TResult Function(SetTimezoneEvent value) setTimezone,
  }) {
    return setTimezone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeEvent value)? initialize,
    TResult? Function(SetTimezoneEvent value)? setTimezone,
  }) {
    return setTimezone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEvent value)? initialize,
    TResult Function(SetTimezoneEvent value)? setTimezone,
    required TResult orElse(),
  }) {
    if (setTimezone != null) {
      return setTimezone(this);
    }
    return orElse();
  }
}

abstract class SetTimezoneEvent implements AccountDrawerEvent {
  const factory SetTimezoneEvent(final Timezone? timezone) =
      _$SetTimezoneEventImpl;

  Timezone? get timezone;
  @JsonKey(ignore: true)
  _$$SetTimezoneEventImplCopyWith<_$SetTimezoneEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountDrawerState {
  User? get user => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountDrawerStateCopyWith<AccountDrawerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDrawerStateCopyWith<$Res> {
  factory $AccountDrawerStateCopyWith(
          AccountDrawerState value, $Res Function(AccountDrawerState) then) =
      _$AccountDrawerStateCopyWithImpl<$Res, AccountDrawerState>;
  @useResult
  $Res call({User? user, String? error});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AccountDrawerStateCopyWithImpl<$Res, $Val extends AccountDrawerState>
    implements $AccountDrawerStateCopyWith<$Res> {
  _$AccountDrawerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountDrawerStateImplCopyWith<$Res>
    implements $AccountDrawerStateCopyWith<$Res> {
  factory _$$AccountDrawerStateImplCopyWith(_$AccountDrawerStateImpl value,
          $Res Function(_$AccountDrawerStateImpl) then) =
      __$$AccountDrawerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AccountDrawerStateImplCopyWithImpl<$Res>
    extends _$AccountDrawerStateCopyWithImpl<$Res, _$AccountDrawerStateImpl>
    implements _$$AccountDrawerStateImplCopyWith<$Res> {
  __$$AccountDrawerStateImplCopyWithImpl(_$AccountDrawerStateImpl _value,
      $Res Function(_$AccountDrawerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AccountDrawerStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AccountDrawerStateImpl extends _AccountDrawerState {
  const _$AccountDrawerStateImpl({this.user, this.error}) : super._();

  @override
  final User? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'AccountDrawerState(user: $user, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDrawerStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDrawerStateImplCopyWith<_$AccountDrawerStateImpl> get copyWith =>
      __$$AccountDrawerStateImplCopyWithImpl<_$AccountDrawerStateImpl>(
          this, _$identity);
}

abstract class _AccountDrawerState extends AccountDrawerState {
  const factory _AccountDrawerState({final User? user, final String? error}) =
      _$AccountDrawerStateImpl;
  const _AccountDrawerState._() : super._();

  @override
  User? get user;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AccountDrawerStateImplCopyWith<_$AccountDrawerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
