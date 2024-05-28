import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_flutter/app/app.dart';

part 'onboarding_bloc.freezed.dart';

typedef _Emit = Emitter<OnboardingState>;

/// {@template OnboardingBloc}
/// {@endtemplate}
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  /// {@macro OnboardingBloc}
  OnboardingBloc({Client? client})
      : _auth = GetIt.I<BaseAuthRepository<AuthUser>>(),
        _client = client ?? GetIt.I<Client>(),
        super(OnboardingState.initial()) {
    on<OnboardingEvent>(
      (event, _Emit emit) => event.map(
        createAccount: (e) => _onCreateAccount(e, emit),
        setUsername: (e) => _onSetUsername(e, emit),
        complete: (e) => _onCompleteOnboarding(e, emit),
      ),
    );
    _auth.initialized.then(
      (_) {
        if (_auth.lastUser.$1 != AuthUser.unknown) {
          _authUser.complete(_auth.lastUser.$1);
        } else {
          add(const CreateAccountEvent());
        }
      },
    );
  }

  final BaseAuthRepository<AuthUser> _auth;
  final Client _client;
  final Completer<AuthUser> _authUser = Completer<AuthUser>();

  Future<void> _onCreateAccount(CreateAccountEvent e, _Emit emit) async {
    emit(state.copyWith(error: null));
    final result = await _auth.signInAnonymously('');

    if (result.isLeft()) {
      final authError = result.leftOrRaise();
      emit(state.copyWith(error: authError.toDisplay()));
    } else {
      _authUser.complete(result.getOrRaise());
    }
  }

  Future<void> _onSetUsername(SetUsernameEvent e, _Emit emit) async {
    await _authUser.future;
    // _client;
  }

  Future<void> _onCompleteOnboarding(CompleteOnboarding e, _Emit emit) async {
    GetIt.I<AppBloc>().add(const AppEventOnboardingCompleted());
  }
}

/// {@template OnboardingState}
/// Complete representation of the Onboarding page's state.
/// {@endtemplate
@Freezed()
class OnboardingState with _$OnboardingState {
  /// {@macro OnboardingState}
  const factory OnboardingState({
    /// True if we are currently awaiting responses on any authentication
    /// requests. This is the period of time between a user tapping a button to
    /// do something, and that action resolving one way or another.
    @Default(false) bool isAuthenticating,

    /// The user's username, to be provided on this screen. Probably their first
    /// name.
    String? username,

    /// Error message to show the user if the app failed to create an anonymous
    /// session.
    String? error,
  }) = _OnboardingState;
  const OnboardingState._();

  /// Starter state fed to the [OnboardingBloc].
  factory OnboardingState.initial() => const OnboardingState();
}

/// Actions that can be taken on the Onboarding page.
@Freezed()
class OnboardingEvent with _$OnboardingEvent {
  /// Creates an empty anonymous account.
  const factory OnboardingEvent.createAccount() = CreateAccountEvent;

  /// Updates the username of the active account.
  const factory OnboardingEvent.setUsername(String username) = SetUsernameEvent;

  /// Signals that onboarding as complete to the rest of the app.
  const factory OnboardingEvent.complete() = CompleteOnboarding;
}
