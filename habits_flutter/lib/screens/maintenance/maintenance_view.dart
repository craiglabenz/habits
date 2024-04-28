import 'package:flutter/material.dart';

/// {@template MaintenanceScreen}
/// Initial Maintenance screen for unknown sessions.
/// {@endtemplate}
class MaintenanceScreen extends StatelessWidget {
  /// {@macro MaintenanceScreen}
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Maintenance'),
      ),
    );
  }
}
