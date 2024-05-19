import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'welcome_bloc.freezed.dart';

typedef _Emit = Emitter<WelcomeState>;

/// {@template WelcomeBloc}
/// {@endtemplate}
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  /// {@macro WelcomeBloc}
  WelcomeBloc({BaseAuthRepository<AuthUser>? auth})
      : _auth = auth ?? GetIt.I<BaseAuthRepository<AuthUser>>(),
        super(WelcomeState.initial()) {
    on<WelcomeEvent>(
      (event, _Emit emit) => event.map(
        createAccount: (e) => _onCreateAccount(e, emit),
      ),
    );
  }

  final BaseAuthRepository<AuthUser> _auth;

  Future<void> _onCreateAccount(CreateAccountEvent e, _Emit emit) async {
    emit(state.copyWith(error: null));
    final result = await _auth.signInAnonymously('');

    if (result.isLeft()) {
      final authError = result.leftOrRaise();
      emit(state.copyWith(error: authError.toDisplay()));
    } else {
      emit(state.copyWith(authUser: result.getOrRaise()));
    }
  }
}

/// Actions that can be taken on the Welcome page.
@Freezed()
class WelcomeEvent with _$WelcomeEvent {
  /// Creates an empty anonymous account.
  const factory WelcomeEvent.createAccount() = CreateAccountEvent;
}

/// {@template WelcomeState}
/// Complete representation of the Welcome page's state.
/// {@endtemplate
@Freezed()
class WelcomeState with _$WelcomeState {
  /// {@macro WelcomeState}
  const factory WelcomeState({
    /// True if we are currently awaiting responses on any authentication
    /// requests. This is the period of time between a user tapping a button to
    /// do something, and that action resolving one way or another.
    @Default(false) bool isAuthenticating,

    /// Account created after the user presses "Get started".
    AuthUser? authUser,

    /// Error message to show the user if the app failed to create an anonymous
    /// session.
    String? error,
  }) = _WelcomeState;
  const WelcomeState._();

  /// Starter state fed to the [WelcomeBloc].
  factory WelcomeState.initial() => const WelcomeState();
}
