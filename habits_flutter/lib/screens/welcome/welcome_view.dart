import 'package:flutter/material.dart';

/// {@template WelcomeScreen}
/// Initial welcome screen for unknown sessions.
/// {@endtemplate}
class WelcomeScreen extends StatelessWidget {
  /// {@macro WelcomeScreen}
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
