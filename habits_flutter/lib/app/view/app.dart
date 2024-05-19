import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:habits_flutter/l10n/l10n.dart';

/// {@template App.widget}
/// Top-level provider widget for the app.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro App.widget}
  const App({super.key});

  @override
  Widget build(BuildContext context) => const AppView();
}

/// {@template AppView.widget}
/// Top-level view widget for the app.
/// {@endtemplate}
class AppView extends StatelessWidget {
  /// {@macro AppView.widget}
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: GetIt.I<AppRouter>().router,
    );
  }
}
