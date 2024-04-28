import 'package:flutter/material.dart';

/// {@template SplashScreen}
/// Initial splash screen for unknown sessions.
/// {@endtemplate}
class SplashScreen extends StatelessWidget {
  /// {@macro SplashScreen}
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
