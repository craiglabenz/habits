import 'package:app_shared/app_shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:habits_shared/habits_shared.dart';

part 'account_drawer_bloc.freezed.dart';

typedef _Emit = Emitter<AccountDrawerState>;

/// {@template AccountDrawerBloc}
/// {@endtemplate}
class AccountDrawerBloc extends Bloc<AccountDrawerEvent, AccountDrawerState> {
  /// {@macro AccountDrawerBloc}
  AccountDrawerBloc()
      : _userRepository = GetIt.I<SessionUserRepository>(),
        super(AccountDrawerState.initial()) {
    on<AccountDrawerEvent>(
      (event, _Emit emit) => event.map(
        initialize: (e) => _onInitialize(e, emit),
        setTimezone: (e) => _onSetTimezone(e, emit),
      ),
    );
  }
  final SessionUserRepository _userRepository;

  Future<void> _onInitialize(InitializeEvent e, _Emit emit) async {
    final hasUser = await _userRepository.ready;
    emit(
      state.copyWith(user: hasUser ? _userRepository.loadedUser : null),
    );
  }

  Future<void> _onSetTimezone(SetTimezoneEvent e, _Emit emit) async {
    final oldUser = state.user!;
    final newUser = oldUser.copyWith(timezone: e.timezone?.name);
    emit(state.copyWith(user: newUser, error: ''));
    final result = await _userRepository.save(newUser);
    if (result.isRight()) {
      // Good! Nothing to do.
    } else {
      // Bad. Rollback :(
      emit(state.copyWith(user: oldUser, error: 'Error saving timezone'));
    }
  }
}

/// Actions that can be taken on the Account Drawer.
@Freezed()
class AccountDrawerEvent with _$AccountDrawerEvent {
  /// Placeholder event.
  const factory AccountDrawerEvent.initialize() = InitializeEvent;

  /// Saves the new [Timezone] value for this [User].
  const factory AccountDrawerEvent.setTimezone(Timezone? timezone) =
      SetTimezoneEvent;
}

/// {@template AccountDrawerState}
/// Complete representation of the Account Drawer's state.
/// {@endtemplate
@Freezed()
class AccountDrawerState with _$AccountDrawerState {
  /// {@macro AccountDrawerState}
  const factory AccountDrawerState({
    User? user,
    String? error,
  }) = _AccountDrawerState;
  const AccountDrawerState._();

  /// Starter state fed to the [AccountDrawerBloc].
  factory AccountDrawerState.initial() => const AccountDrawerState();
}
