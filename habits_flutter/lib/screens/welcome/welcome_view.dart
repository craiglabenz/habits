import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/core/core.dart';

/// {@template WelcomeScreen}
/// Initial welcome screen for unknown sessions.
/// {@endtemplate}
class WelcomeScreen extends StatefulWidget {
  /// {@macro WelcomeScreen}
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => GetIt.I<AppRouter>().pushOnboarding(),
            child: Text(
              'Get started',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
            onPressed: () => GetIt.I<AppRouter>().pushLogin(),
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
