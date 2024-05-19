import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_bloc.freezed.dart';

typedef _Emit = Emitter<OnboardingState>;

/// {@template OnboardingBloc}
/// {@endtemplate}
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  /// {@macro OnboardingBloc}
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<OnboardingEvent>(
      (event, _Emit emit) => event.map(
        setUsername: (e) => _onSetUsername(e, emit),
      ),
    );
  }

  Future<void> _onSetUsername(SetUsernameEvent e, _Emit emit) async {}
}

/// Actions that can be taken on the Onboarding page.
@Freezed()
class OnboardingEvent with _$OnboardingEvent {
  /// Updates the username of the active account.
  const factory OnboardingEvent.setUsername(String username) = SetUsernameEvent;
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
