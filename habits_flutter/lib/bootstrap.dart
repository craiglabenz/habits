import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:habits_flutter/firebase_options.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

/// {@template AppBlocObserver}
/// Logger of all things related to `pkg:flutter_bloc`.
/// {@endtemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro AppBlocObserver}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Initializes global dependencies and then starts the app.
Future<void> bootstrap({
  required String apiBaseUrl,
  required Environment env,
  required Widget child,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLiveDI(apiBaseUrl: apiBaseUrl, env: env);
  await GetIt.I<SessionManager>().initialize();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(child);
}
