import 'package:flutter/material.dart';
import 'package:habits_flutter/screens/login/login.dart';

/// {@template LoginScreen}
/// Initial Login screen for unknown sessions.
/// {@endtemplate}
class LoginScreen extends StatefulWidget {
  /// {@macro LoginScreen}
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => {},
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
