import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/screens/home/home.dart';

/// {@template HomeScreen}
/// Initial Home screen for unknown sessions.
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  /// {@macro HomeScreen}
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => GetIt.I<BaseAuthRepository<AuthUser>>().logOut(),
            child: Text(
              'Logout',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
