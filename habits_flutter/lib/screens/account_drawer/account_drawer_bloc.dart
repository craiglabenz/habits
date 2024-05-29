import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_drawer_bloc.freezed.dart';

typedef _Emit = Emitter<AccountDrawerState>;

/// {@template AccountDrawerBloc}
/// {@endtemplate}
class AccountDrawerBloc extends Bloc<AccountDrawerEvent, AccountDrawerState> {
  /// {@macro AccountDrawerBloc}
  AccountDrawerBloc() : super(AccountDrawerState.initial()) {
    on<AccountDrawerEvent>(
      (event, _Emit emit) {},
    );
  }
}

/// Actions that can be taken on the Account Drawer.
@Freezed()
class AccountDrawerEvent with _$AccountDrawerEvent {
  /// Placeholder event.
  const factory AccountDrawerEvent.init() = InitializeAccountDrawer;
}

/// {@template AccountDrawerState}
/// Complete representation of the Account Drawer's state.
/// {@endtemplate
@Freezed()
class AccountDrawerState with _$AccountDrawerState {
  /// {@macro AccountDrawerState}
  const factory AccountDrawerState() = _AccountDrawerState;
  const AccountDrawerState._();

  /// Starter state fed to the [AccountDrawerBloc].
  factory AccountDrawerState.initial() => const AccountDrawerState();
}
