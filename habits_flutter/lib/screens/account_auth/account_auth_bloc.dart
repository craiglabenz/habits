// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:habits_shared/habits_shared.dart';

part 'account_auth_bloc.freezed.dart';

typedef _Emit = Emitter<AccountAuthState>;

/// {@template AccountAuthBloc}
/// {@endtemplate}
class AccountAuthBloc extends Bloc<AccountAuthEvent, AccountAuthState> {
  /// {@macro AccountAuthBloc}
  AccountAuthBloc(
    BaseAuthRepository<AuthUser> authRepo,
    BaseSessionUserRepository userRepo,
  )   : assert(
          authRepo.isReady,
          'Must not initialize AccountAuthBloc before AuthRepo is ready',
        ),
        assert(
          userRepo.isReady,
          'Must not initialize AccountAuthBloc before SessionUserRepository is '
          'ready',
        ),
        _authRepo = authRepo,
        _userRepo = userRepo,
        super(
          AccountAuthState.initial(authRepo.lastUser.$1, userRepo.loadedUser),
        ) {
    on<AccountAuthEvent>(
      (event, _Emit emit) => event.map(
        init: (e) => _onInit(e, emit),
        addEmailAuth: (e) => _onAddEmailAuth(e, emit),
        emailChanged: (e) => _onEmailChanged(e, emit),
        passwordChanged: (e) => _onPasswordChanged(e, emit),
        saveNewEmail: (e) => _onSaveNewEmail(e, emit),
        saveNewPassword: (e) => _onSaveNewPassword(e, emit),
      ),
    );
  }

  final BaseAuthRepository<AuthUser> _authRepo;
  final BaseSessionUserRepository _userRepo;

  void _onInit(e, _Emit emit) {}

  Future<void> _onAddEmailAuth(AddEmailAuthEvent e, _Emit emit) async {
    assert(
      state.hasValidNewEmail,
      'Cannot add email auth without a valid email',
    );
    assert(
      state.hasValidNewPassword,
      'Cannot add email auth without a valid password',
    );
    final authResponse = await _authRepo.addEmailAuth(
      email: state.newEmail!,
      password: state.newPassword!,
    );
    if (authResponse.isLeft()) {
      return emit(state.copyWith(savingError: 'Error saving email auth'));
    }
    emit(
      state.copyWith(
        authUser: authResponse.getOrRaise(),
        newEmail: null,
        newPassword: null,
        savingError: null,
      ),
    );
  }

  void _onEmailChanged(EmailChangedEvent e, _Emit emit) => emit(
        state.copyWith(
          newEmail: e.email,
          newEmailValidationError: Email(e.email).validate(),
          savingError: null,
        ),
      );
  void _onPasswordChanged(PasswordChangedEvent e, _Emit emit) => emit(
        state.copyWith(
          newPassword: e.password,
          newPasswordValidationError: Password(e.password).validate(),
          savingError: null,
        ),
      );

  Future<void> _onSaveNewEmail(SaveNewEmailEvent e, _Emit emit) async {
    assert(state.newEmail != null, 'Must have a new email value to save');
    assert(
      state.newEmailValidationError == null,
      'Can only save valid emails',
    );
    final userOrError = await _authRepo.updateEmail(state.newEmail!);
    if (userOrError.isRight()) {
      emit(
        state.copyWith(
          newEmail: null,
          newEmailValidationError: null,
          savingError: null,
          authUser: userOrError.getOrRaise(),
        ),
      );
    } else {
      emit(state.copyWith(savingError: 'Failed to save email'));
    }
  }

  Future<void> _onSaveNewPassword(SaveNewPasswordEvent e, _Emit emit) async {
    assert(state.newPassword != null, 'Must have a new password value to save');
    assert(
      state.newPasswordValidationError == null,
      'Can only save valid passwords',
    );
    final userOrError = await _authRepo.updatePassword(state.newPassword!);
    if (userOrError.isRight()) {
      emit(
        state.copyWith(
          newPassword: null,
          newPasswordValidationError: null,
          savingError: null,
          authUser: userOrError.getOrRaise(),
        ),
      );
    } else {
      emit(state.copyWith(savingError: 'Error saving new password'));
    }
  }
}

/// Actions that can be taken on the AccountAuth page.
@Freezed()
class AccountAuthEvent with _$AccountAuthEvent {
  /// Placeholder event.
  const factory AccountAuthEvent.init() = InitializeAccountAuth;

  /// Saves email auth for an account currently only using anonymous auth.
  const factory AccountAuthEvent.addEmailAuth() = AddEmailAuthEvent;

  /// Updates `state.newEmail`.
  const factory AccountAuthEvent.emailChanged(String email) = EmailChangedEvent;

  /// Updates `state.newPassword`.
  const factory AccountAuthEvent.passwordChanged(String password) =
      PasswordChangedEvent;

  /// Persists `state.newEmail` to the server.
  const factory AccountAuthEvent.saveNewEmail() = SaveNewEmailEvent;

  /// Persists `state.newPassword` to the server.
  const factory AccountAuthEvent.saveNewPassword() = SaveNewPasswordEvent;
}

/// {@template AccountAuthState}
/// Complete representation of the AccountAuth page's state.
/// {@endtemplate
@Freezed()
class AccountAuthState with _$AccountAuthState {
  /// {@macro AccountAuthState}
  const factory AccountAuthState({
    required AuthUser authUser,
    required User user,

    /// Not null if we just experienced a failed write to the server. This is
    /// merely a [String] because we shouldn't have any good explanations for
    /// why the save failed, given that we only attempt to save when both
    /// validation error fields are null.
    String? savingError,

    /// Contains an unsaved email address this user is registering or updating.
    String? newEmail,

    /// True or false only if [newEmail] is not null. Otherwise, also null.
    InvalidValueError? newEmailValidationError,

    /// Contains an unsaved password this user is adding or updating.
    String? newPassword,

    /// True or false only if [newPassword] is not null. Otherwise, also null.
    InvalidValueError? newPasswordValidationError,
  }) = _AccountAuthState;
  const AccountAuthState._();

  /// Starter state fed to the [AccountAuthBloc].
  factory AccountAuthState.initial(AuthUser authUser, User user) =>
      AccountAuthState(authUser: authUser, user: user);

  /// Returns true if there is a valid but unsaved email.
  bool get hasValidNewEmail =>
      (newEmail ?? '').isNotEmpty && newEmailValidationError == null;

  /// Returns true if there is a valid but unsaved password.
  bool get hasValidNewPassword =>
      (newPassword ?? '').isNotEmpty && newPasswordValidationError == null;
}
