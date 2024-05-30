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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: () => GetIt.I<AppRouter>().pushOnboarding(),
              child: Text(
                'Get started',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            FilledButton(
              onPressed: () => GetIt.I<AppRouter>().pushLogin(),
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
