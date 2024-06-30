import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:habits_flutter/screens/account_auth/account_auth.dart';

/// {@template AccountAuthScreen}
/// Initial AccountAuth screen for unknown sessions.
/// {@endtemplate}
class AccountAuthScreen extends StatefulWidget {
  /// {@macro AccountAuthScreen}
  const AccountAuthScreen({super.key});

  @override
  State<AccountAuthScreen> createState() => _AccountAuthScreenState();
}

class _AccountAuthScreenState extends State<AccountAuthScreen> {
  late final AccountAuthBloc bloc;
  final _emailController = TextEditingController();

  @override
  void initState() {
    bloc = AccountAuthBloc(
      GetIt.I<BaseAuthRepository<AuthUser>>(),
      GetIt.I<SessionUserRepository>(),
    );
    if (bloc.state.authUser.allMethods.contains(AuthType.email)) {
      _emailController.text = bloc.state.authUser.email!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AccountAuth')),
      body: BlocBuilder<AccountAuthBloc, AccountAuthState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView(
            children: <Widget>[
              _EmailAuthSwitcher(
                authUser: state.authUser,
                onEmailChanged: (val) => _emailController.text = val,
                onPasswordChanged: (val) => bloc.add(PasswordChangedEvent(val)),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Future<void> dispose() async {
    _emailController.dispose();
    await bloc.close();
    super.dispose();
  }
}

class _EmailAuthSwitcher extends StatelessWidget {
  const _EmailAuthSwitcher({
    required this.authUser,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });
  final AuthUser authUser;
  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
  @override
  Widget build(BuildContext context) => authUser.hasEmailAuth
      ? _ExistingEmailAuth(onEmailChanged: onEmailChanged)
      : _AddEmailAuth(
          onEmailChanged: onEmailChanged,
          onPasswordChanged: onPasswordChanged,
        );
}

class _AddEmailAuth extends StatelessWidget {
  const _AddEmailAuth({
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Add an email and password to secure your account'),
        const Text('Email'),
        TextField(onChanged: onEmailChanged),
        const Text('Password'),
        TextField(onChanged: onPasswordChanged),
      ],
    );
  }
}

class _ExistingEmailAuth extends StatelessWidget {
  const _ExistingEmailAuth({
    required this.onEmailChanged,
  });

  final void Function(String) onEmailChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Email'),
        TextField(onChanged: onEmailChanged),
      ],
    );
  }
}
