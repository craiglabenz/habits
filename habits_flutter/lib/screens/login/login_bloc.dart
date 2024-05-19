import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';

typedef _Emit = Emitter<LoginState>;

/// {@template LoginBloc}
/// {@endtemplate}
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// {@macro LoginBloc}
  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>(
      (event, _Emit emit) {},
    );
  }
}

/// Actions that can be taken on the Login page.
@Freezed()
class LoginEvent with _$LoginEvent {
  /// Placeholder event.
  const factory LoginEvent.init() = InitializeLogin;
}

/// {@template LoginState}
/// Complete representation of the Login page's state.
/// {@endtemplate
@Freezed()
class LoginState with _$LoginState {
  /// {@macro LoginState}
  const factory LoginState() = _LoginState;
  const LoginState._();

  /// Starter state fed to the [LoginBloc].
  factory LoginState.initial() => const LoginState();
}
