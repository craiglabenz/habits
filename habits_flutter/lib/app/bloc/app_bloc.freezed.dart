// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  bool get isDownForMaintenance => throw _privateConstructorUsedError;
  ForceUpgrade get forceUpgrade => throw _privateConstructorUsedError;
  AuthUser? get user => throw _privateConstructorUsedError;
  bool get isNewUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {bool isDownForMaintenance,
      ForceUpgrade forceUpgrade,
      AuthUser? user,
      bool isNewUser});

  $AuthUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDownForMaintenance = null,
    Object? forceUpgrade = null,
    Object? user = freezed,
    Object? isNewUser = null,
  }) {
    return _then(_value.copyWith(
      isDownForMaintenance: null == isDownForMaintenance
          ? _value.isDownForMaintenance
          : isDownForMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpgrade: null == forceUpgrade
          ? _value.forceUpgrade
          : forceUpgrade // ignore: cast_nullable_to_non_nullable
              as ForceUpgrade,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AuthUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDownForMaintenance,
      ForceUpgrade forceUpgrade,
      AuthUser? user,
      bool isNewUser});

  @override
  $AuthUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDownForMaintenance = null,
    Object? forceUpgrade = null,
    Object? user = freezed,
    Object? isNewUser = null,
  }) {
    return _then(_$AppStateImpl(
      isDownForMaintenance: null == isDownForMaintenance
          ? _value.isDownForMaintenance
          : isDownForMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpgrade: null == forceUpgrade
          ? _value.forceUpgrade
          : forceUpgrade // ignore: cast_nullable_to_non_nullable
              as ForceUpgrade,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl extends _AppState {
  const _$AppStateImpl(
      {this.isDownForMaintenance = false,
      this.forceUpgrade = const ForceUpgrade(isUpgradeRequired: false),
      this.user,
      this.isNewUser = false})
      : super._();

  @override
  @JsonKey()
  final bool isDownForMaintenance;
  @override
  @JsonKey()
  final ForceUpgrade forceUpgrade;
  @override
  final AuthUser? user;
  @override
  @JsonKey()
  final bool isNewUser;

  @override
  String toString() {
    return 'AppState(isDownForMaintenance: $isDownForMaintenance, forceUpgrade: $forceUpgrade, user: $user, isNewUser: $isNewUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.isDownForMaintenance, isDownForMaintenance) ||
                other.isDownForMaintenance == isDownForMaintenance) &&
            (identical(other.forceUpgrade, forceUpgrade) ||
                other.forceUpgrade == forceUpgrade) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isDownForMaintenance, forceUpgrade, user, isNewUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState extends AppState {
  const factory _AppState(
      {final bool isDownForMaintenance,
      final ForceUpgrade forceUpgrade,
      final AuthUser? user,
      final bool isNewUser}) = _$AppStateImpl;
  const _AppState._() : super._();

  @override
  bool get isDownForMaintenance;
  @override
  ForceUpgrade get forceUpgrade;
  @override
  AuthUser? get user;
  @override
  bool get isNewUser;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppEventLogoutRequestedImplCopyWith<$Res> {
  factory _$$AppEventLogoutRequestedImplCopyWith(
          _$AppEventLogoutRequestedImpl value,
          $Res Function(_$AppEventLogoutRequestedImpl) then) =
      __$$AppEventLogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventLogoutRequestedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventLogoutRequestedImpl>
    implements _$$AppEventLogoutRequestedImplCopyWith<$Res> {
  __$$AppEventLogoutRequestedImplCopyWithImpl(
      _$AppEventLogoutRequestedImpl _value,
      $Res Function(_$AppEventLogoutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppEventLogoutRequestedImpl implements AppEventLogoutRequested {
  const _$AppEventLogoutRequestedImpl();

  @override
  String toString() {
    return 'AppEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventLogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class AppEventLogoutRequested implements AppEvent {
  const factory AppEventLogoutRequested() = _$AppEventLogoutRequestedImpl;
}

/// @nodoc
abstract class _$$AppEventOnboardingCompletedImplCopyWith<$Res> {
  factory _$$AppEventOnboardingCompletedImplCopyWith(
          _$AppEventOnboardingCompletedImpl value,
          $Res Function(_$AppEventOnboardingCompletedImpl) then) =
      __$$AppEventOnboardingCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventOnboardingCompletedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventOnboardingCompletedImpl>
    implements _$$AppEventOnboardingCompletedImplCopyWith<$Res> {
  __$$AppEventOnboardingCompletedImplCopyWithImpl(
      _$AppEventOnboardingCompletedImpl _value,
      $Res Function(_$AppEventOnboardingCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppEventOnboardingCompletedImpl implements AppEventOnboardingCompleted {
  const _$AppEventOnboardingCompletedImpl();

  @override
  String toString() {
    return 'AppEvent.onboardingCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventOnboardingCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) {
    return onboardingCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) {
    return onboardingCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) {
    if (onboardingCompleted != null) {
      return onboardingCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) {
    return onboardingCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) {
    return onboardingCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (onboardingCompleted != null) {
      return onboardingCompleted(this);
    }
    return orElse();
  }
}

abstract class AppEventOnboardingCompleted implements AppEvent {
  const factory AppEventOnboardingCompleted() =
      _$AppEventOnboardingCompletedImpl;
}

/// @nodoc
abstract class _$$AppEventDownForMaintenanceStatusChangedImplCopyWith<$Res> {
  factory _$$AppEventDownForMaintenanceStatusChangedImplCopyWith(
          _$AppEventDownForMaintenanceStatusChangedImpl value,
          $Res Function(_$AppEventDownForMaintenanceStatusChangedImpl) then) =
      __$$AppEventDownForMaintenanceStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDownForMaintenance});
}

/// @nodoc
class __$$AppEventDownForMaintenanceStatusChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res,
        _$AppEventDownForMaintenanceStatusChangedImpl>
    implements _$$AppEventDownForMaintenanceStatusChangedImplCopyWith<$Res> {
  __$$AppEventDownForMaintenanceStatusChangedImplCopyWithImpl(
      _$AppEventDownForMaintenanceStatusChangedImpl _value,
      $Res Function(_$AppEventDownForMaintenanceStatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDownForMaintenance = null,
  }) {
    return _then(_$AppEventDownForMaintenanceStatusChangedImpl(
      null == isDownForMaintenance
          ? _value.isDownForMaintenance
          : isDownForMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppEventDownForMaintenanceStatusChangedImpl
    implements AppEventDownForMaintenanceStatusChanged {
  const _$AppEventDownForMaintenanceStatusChangedImpl(
      this.isDownForMaintenance);

// ignore: avoid_positional_boolean_parameters
  @override
  final bool isDownForMaintenance;

  @override
  String toString() {
    return 'AppEvent.downForMaintenanceStatusChanged(isDownForMaintenance: $isDownForMaintenance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventDownForMaintenanceStatusChangedImpl &&
            (identical(other.isDownForMaintenance, isDownForMaintenance) ||
                other.isDownForMaintenance == isDownForMaintenance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDownForMaintenance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventDownForMaintenanceStatusChangedImplCopyWith<
          _$AppEventDownForMaintenanceStatusChangedImpl>
      get copyWith =>
          __$$AppEventDownForMaintenanceStatusChangedImplCopyWithImpl<
              _$AppEventDownForMaintenanceStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) {
    return downForMaintenanceStatusChanged(isDownForMaintenance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) {
    return downForMaintenanceStatusChanged?.call(isDownForMaintenance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) {
    if (downForMaintenanceStatusChanged != null) {
      return downForMaintenanceStatusChanged(isDownForMaintenance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) {
    return downForMaintenanceStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) {
    return downForMaintenanceStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (downForMaintenanceStatusChanged != null) {
      return downForMaintenanceStatusChanged(this);
    }
    return orElse();
  }
}

abstract class AppEventDownForMaintenanceStatusChanged implements AppEvent {
  const factory AppEventDownForMaintenanceStatusChanged(
          final bool isDownForMaintenance) =
      _$AppEventDownForMaintenanceStatusChangedImpl;

// ignore: avoid_positional_boolean_parameters
  bool get isDownForMaintenance;
  @JsonKey(ignore: true)
  _$$AppEventDownForMaintenanceStatusChangedImplCopyWith<
          _$AppEventDownForMaintenanceStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppEventForceUpgradeStatusChangedImplCopyWith<$Res> {
  factory _$$AppEventForceUpgradeStatusChangedImplCopyWith(
          _$AppEventForceUpgradeStatusChangedImpl value,
          $Res Function(_$AppEventForceUpgradeStatusChangedImpl) then) =
      __$$AppEventForceUpgradeStatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ForceUpgrade forceUpgrade});
}

/// @nodoc
class __$$AppEventForceUpgradeStatusChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res,
        _$AppEventForceUpgradeStatusChangedImpl>
    implements _$$AppEventForceUpgradeStatusChangedImplCopyWith<$Res> {
  __$$AppEventForceUpgradeStatusChangedImplCopyWithImpl(
      _$AppEventForceUpgradeStatusChangedImpl _value,
      $Res Function(_$AppEventForceUpgradeStatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpgrade = null,
  }) {
    return _then(_$AppEventForceUpgradeStatusChangedImpl(
      null == forceUpgrade
          ? _value.forceUpgrade
          : forceUpgrade // ignore: cast_nullable_to_non_nullable
              as ForceUpgrade,
    ));
  }
}

/// @nodoc

class _$AppEventForceUpgradeStatusChangedImpl
    implements AppEventForceUpgradeStatusChanged {
  const _$AppEventForceUpgradeStatusChangedImpl(this.forceUpgrade);

  @override
  final ForceUpgrade forceUpgrade;

  @override
  String toString() {
    return 'AppEvent.forceUpgradeStatusChanged(forceUpgrade: $forceUpgrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventForceUpgradeStatusChangedImpl &&
            (identical(other.forceUpgrade, forceUpgrade) ||
                other.forceUpgrade == forceUpgrade));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceUpgrade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventForceUpgradeStatusChangedImplCopyWith<
          _$AppEventForceUpgradeStatusChangedImpl>
      get copyWith => __$$AppEventForceUpgradeStatusChangedImplCopyWithImpl<
          _$AppEventForceUpgradeStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) {
    return forceUpgradeStatusChanged(forceUpgrade);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) {
    return forceUpgradeStatusChanged?.call(forceUpgrade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) {
    if (forceUpgradeStatusChanged != null) {
      return forceUpgradeStatusChanged(forceUpgrade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) {
    return forceUpgradeStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) {
    return forceUpgradeStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (forceUpgradeStatusChanged != null) {
      return forceUpgradeStatusChanged(this);
    }
    return orElse();
  }
}

abstract class AppEventForceUpgradeStatusChanged implements AppEvent {
  const factory AppEventForceUpgradeStatusChanged(
          final ForceUpgrade forceUpgrade) =
      _$AppEventForceUpgradeStatusChangedImpl;

  ForceUpgrade get forceUpgrade;
  @JsonKey(ignore: true)
  _$$AppEventForceUpgradeStatusChangedImplCopyWith<
          _$AppEventForceUpgradeStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppEventUserChangedImplCopyWith<$Res> {
  factory _$$AppEventUserChangedImplCopyWith(_$AppEventUserChangedImpl value,
          $Res Function(_$AppEventUserChangedImpl) then) =
      __$$AppEventUserChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user, bool? isNewUser});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AppEventUserChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventUserChangedImpl>
    implements _$$AppEventUserChangedImplCopyWith<$Res> {
  __$$AppEventUserChangedImplCopyWithImpl(_$AppEventUserChangedImpl _value,
      $Res Function(_$AppEventUserChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isNewUser = freezed,
  }) {
    return _then(_$AppEventUserChangedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      isNewUser: freezed == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AppEventUserChangedImpl implements AppEventUserChanged {
  const _$AppEventUserChangedImpl(this.user, {this.isNewUser});

  @override
  final AuthUser user;
  @override
  final bool? isNewUser;

  @override
  String toString() {
    return 'AppEvent.userChanged(user: $user, isNewUser: $isNewUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventUserChangedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isNewUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventUserChangedImplCopyWith<_$AppEventUserChangedImpl> get copyWith =>
      __$$AppEventUserChangedImplCopyWithImpl<_$AppEventUserChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequested,
    required TResult Function() onboardingCompleted,
    required TResult Function(bool isDownForMaintenance)
        downForMaintenanceStatusChanged,
    required TResult Function(ForceUpgrade forceUpgrade)
        forceUpgradeStatusChanged,
    required TResult Function(AuthUser user, bool? isNewUser) userChanged,
  }) {
    return userChanged(user, isNewUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequested,
    TResult? Function()? onboardingCompleted,
    TResult? Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult? Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult? Function(AuthUser user, bool? isNewUser)? userChanged,
  }) {
    return userChanged?.call(user, isNewUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequested,
    TResult Function()? onboardingCompleted,
    TResult Function(bool isDownForMaintenance)?
        downForMaintenanceStatusChanged,
    TResult Function(ForceUpgrade forceUpgrade)? forceUpgradeStatusChanged,
    TResult Function(AuthUser user, bool? isNewUser)? userChanged,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(user, isNewUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventLogoutRequested value) logoutRequested,
    required TResult Function(AppEventOnboardingCompleted value)
        onboardingCompleted,
    required TResult Function(AppEventDownForMaintenanceStatusChanged value)
        downForMaintenanceStatusChanged,
    required TResult Function(AppEventForceUpgradeStatusChanged value)
        forceUpgradeStatusChanged,
    required TResult Function(AppEventUserChanged value) userChanged,
  }) {
    return userChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventLogoutRequested value)? logoutRequested,
    TResult? Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult? Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult? Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult? Function(AppEventUserChanged value)? userChanged,
  }) {
    return userChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventLogoutRequested value)? logoutRequested,
    TResult Function(AppEventOnboardingCompleted value)? onboardingCompleted,
    TResult Function(AppEventDownForMaintenanceStatusChanged value)?
        downForMaintenanceStatusChanged,
    TResult Function(AppEventForceUpgradeStatusChanged value)?
        forceUpgradeStatusChanged,
    TResult Function(AppEventUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(this);
    }
    return orElse();
  }
}

abstract class AppEventUserChanged implements AppEvent {
  const factory AppEventUserChanged(final AuthUser user,
      {final bool? isNewUser}) = _$AppEventUserChangedImpl;

  AuthUser get user;
  bool? get isNewUser;
  @JsonKey(ignore: true)
  _$$AppEventUserChangedImplCopyWith<_$AppEventUserChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
