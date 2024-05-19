import 'package:flutter/material.dart';
import 'package:habits_flutter/screens/onboarding/onboarding.dart';

/// {@template OnboardingScreen}
/// Initial Onboarding screen for unknown sessions.
/// {@endtemplate}
class OnboardingScreen extends StatefulWidget {
  /// {@macro OnboardingScreen}
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingBloc bloc = OnboardingBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => {},
            child: Text(
              'Onboarding',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
