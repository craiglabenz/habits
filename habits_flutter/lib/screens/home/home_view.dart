import 'package:flutter/material.dart';
import 'package:habits_flutter/screens/home/home.dart';
import 'package:habits_flutter/widgets/widgets.dart';

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
      drawer: const AccountDrawer(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(child: Text('Home')),
        ],
      ),
    );
  }
}
