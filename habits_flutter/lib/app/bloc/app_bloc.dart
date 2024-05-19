import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habits_flutter/app_config/app_config.dart';

part 'app_bloc.freezed.dart';

/// {@template AppBloc}
/// State manager for high level app details.
/// {@endtemplate}
class AppBloc extends Bloc<AppEvent, AppState> {
  /// {@macro AppBloc}
  AppBloc({
    required BaseAppConfigRepository appConfigRepository,
    required BaseAuthRepository<AuthUser> authRepository,
    AuthUser? authUser,
  })  : _authRepository = authRepository,
        super(AppState.initial(authUser)) {
    _forceUpgradeSubscription = appConfigRepository.isForceUpgradeRequired
        .listen(_onForceUpgradeStatusChanged);
    _isDownForMaintenanceSubscription = appConfigRepository.isDownForMaintenance
        .listen(_onDownForMaintenanceStatusChanged);
    _userSubscription = _authRepository.user.listen(_onUserChanged);
    _authRepository.initialized.then((_) {
      _onUserChanged(_authRepository.lastUser!);
    });

    on<AppEvent>(
      (event, emit) => event.map(
        logoutRequested: (AppEventLogoutRequested event) =>
            _logoutRequested(event, emit),
        onboardingCompleted: (AppEventOnboardingCompleted event) =>
            _onboardingCompleted(event, emit),
        downForMaintenanceStatusChanged:
            (AppEventDownForMaintenanceStatusChanged event) =>
                _downForMaintenanceStatusChanged(event, emit),
        forceUpgradeStatusChanged: (AppEventForceUpgradeStatusChanged event) =>
            _forceUpgradeStatusChanged(event, emit),
        userChanged: (AppEventUserChanged event) => //
            _userChanged(event, emit),
      ),
    );
  }

  final BaseAuthRepository<AuthUser> _authRepository;
  late StreamSubscription<ForceUpgrade> _forceUpgradeSubscription;
  late StreamSubscription<bool> _isDownForMaintenanceSubscription;
  late StreamSubscription<(AuthUser, bool)> _userSubscription;

  void _onDownForMaintenanceStatusChanged(bool isDownForMaintenance) =>
      add(AppEvent.downForMaintenanceStatusChanged(isDownForMaintenance));

  void _onForceUpgradeStatusChanged(ForceUpgrade forceUpgrade) =>
      add(AppEvent.forceUpgradeStatusChanged(forceUpgrade));

  void _onUserChanged((AuthUser user, bool isNewUser) update) =>
      add(AppEvent.userChanged(update.$1, isNewUser: update.$2));

  void _logoutRequested(AppEventLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logOut());
  }

  void _downForMaintenanceStatusChanged(
    AppEventDownForMaintenanceStatusChanged event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(isDownForMaintenance: event.isDownForMaintenance));

  void _onboardingCompleted(
    AppEventOnboardingCompleted event,
    Emitter<AppState> emit,
  ) {}
  // _authRepository.onboardingCompleted();

  void _forceUpgradeStatusChanged(
    AppEventForceUpgradeStatusChanged event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(forceUpgrade: event.forceUpgrade));

  void _userChanged(
    AppEventUserChanged event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(user: event.user));

  @override
  Future<void> close() {
    _forceUpgradeSubscription.cancel();
    _isDownForMaintenanceSubscription.cancel();
    _userSubscription.cancel();
    return super.close();
  }
}

/// {@template AppState}
///
/// {@endtemplate}
@Freezed()
class AppState with _$AppState {
  /// {@macro AppState}
  const factory AppState({
    @Default(false) bool isDownForMaintenance,
    @Default(ForceUpgrade(isUpgradeRequired: false)) ForceUpgrade forceUpgrade,
    AuthUser? user,
    @Default(false) bool isNewUser,
  }) = _AppState;

  /// Initial [AppState] constructor.
  factory AppState.initial([AuthUser? user]) => AppState(user: user);
  const AppState._();

  /// Returns true if we have no knowledge of the current user. This usually
  /// means the initial check for an existing session has not even completed.
  bool get isUserUnknown => user == null;

  /// Returns true if the current user is known to be anonymous. This means the
  /// initial check for an existing user has completed but returned null.
  bool get isAnonymous => user == AuthUser.anonymous;

  /// Returns true if the current user is logged in.
  bool get isAuthenticated => !isUserUnknown && !isAnonymous;

  /// Returns true if the user must upgrade their app.
  bool get isUpgradeRequired => forceUpgrade.isUpgradeRequired;

  /// Returns true if the current user is logged in and the app is healthy.
  bool get isReady =>
      isAuthenticated && !isDownForMaintenance && !isUpgradeRequired;
}

/// Container for events which can mutate the [AppState].
@Freezed()
class AppEvent with _$AppEvent {
  /// Event which logs out the current user.
  const factory AppEvent.logoutRequested() = AppEventLogoutRequested;

  /// Event which removes the user's `isNewUser` indicator.
  /// TODO(craiglabenz): This is probably not implemented.
  const factory AppEvent.onboardingCompleted() = AppEventOnboardingCompleted;

  /// Event which moves the app into the "down for maintenance" state.
  const factory AppEvent.downForMaintenanceStatusChanged(
    // ignore: avoid_positional_boolean_parameters
    bool isDownForMaintenance,
  ) = AppEventDownForMaintenanceStatusChanged;

  /// Event which moves the app into the "please upgrade" state.
  const factory AppEvent.forceUpgradeStatusChanged(ForceUpgrade forceUpgrade) =
      AppEventForceUpgradeStatusChanged;

  /// Event which tells the rest of the app that the user authentication story
  /// has changed. If [user] equals [AuthUser.anonymous] then this would imply
  /// a successful logout. If [user] is not [AuthUser.anonymous], then
  /// [isNewUser] must be non-null.
  const factory AppEvent.userChanged(
    AuthUser user, {
    bool? isNewUser,
  }) = AppEventUserChanged;
}
