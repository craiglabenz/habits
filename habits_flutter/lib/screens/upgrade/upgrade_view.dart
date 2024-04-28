import 'package:flutter/material.dart';

/// {@template UpgradeScreen}
/// Initial Upgrade screen for unknown sessions.
/// {@endtemplate}
class UpgradeScreen extends StatelessWidget {
  /// {@macro UpgradeScreen}
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Upgrade'),
      ),
    );
  }
}
