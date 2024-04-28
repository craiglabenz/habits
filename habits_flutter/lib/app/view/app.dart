import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:habits_flutter/l10n/l10n.dart';
import 'package:provider/provider.dart';

/// {@template App.widget}
/// Top-level provider widget for the app.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro App.widget}
  const App({
    required this.deps,
    super.key,
  });

  /// Container for all repositories and blocs pulled out of GetIt.
  final AppDependencies deps;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // Needed for individual Route redirects, which are passed the
          // [BuildContext] and thus require this [BlocProvider] to access the
          // primary [AppBloc].
          BlocProvider<AppBloc>.value(value: deps.appBloc),
        ],
        child: const AppView(),
      );
}

/// {@template AppView.widget}
/// Top-level view widget for the app.
/// {@endtemplate}
class AppView extends StatelessWidget {
  /// {@macro AppView.widget}
  const AppView({
    this.appRouter,
    super.key,
  });

  /// Optional [AppRouter] override.
  final AppRouter? appRouter;

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
      routerConfig: (appRouter ?? GetIt.I<AppRouter>()).router,
    );
  }
}
