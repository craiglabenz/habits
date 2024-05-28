import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/core/core.dart';

/// {@template AppRouter}
/// Navigation stack mutator given to the rest of the application.
/// {@endtemplate}
class AppRouter {
  /// {@macro AppRouter}
  AppRouter(AppBloc appBloc) : _appBloc = appBloc {
    router = GoRouter(
      routes: [
        Routes.splash,
        Routes.welcome,
        Routes.onboarding,
        // includes Routes.login
        // includes Routes.onboarding
        Routes.maintenance,
        Routes.upgrade,
        Routes.home,
      ],
      // refreshListenable: GoRouterRefreshStream(_appBloc.stream),
      initialLocation: initialRoute.path,
      redirect: (context, GoRouterState state) {
        // print('Calling redirect with GoRouterState:');
        // print('  • uri: ${state.uri}');
        // print('  • matchedLocation: ${state.matchedLocation}');
        // print('  • name: ${state.name}');
        // print('  • path: ${state.path}');
        // print('  • fullPath: ${state.fullPath}');
        // print('  • pathParameters: ${state.pathParameters}');
        // print('  • extra: ${state.extra}');
        // print('  • error: ${state.error}');
        // print('  • pageKey: ${state.pageKey}');

        lastGoRouterState = state;
        return _redirect(_appBloc.state);
      },
    );
    _appBloc.stream.listen((appState) {
      // print('AppRouter.appState: $appState');
      final redirection = _redirect(appState);
      if (redirection != null) {
        goTo(redirection);
      }
    });
  }

  final _redirections = StreamController<String?>.broadcast();

  /// Emits redirection decisions
  @visibleForTesting
  Stream<String?> get allRedirects => _redirections.stream;

  /// Same as [allRedirects], but with `null` values removed.
  @visibleForTesting
  Stream<String> get redirects => allRedirects
      .where((String? val) => val != null)
      .map<String>((String? val) => val!);

  String? _redirect(AppState appState) {
    final routeState = RouteState.fromGoRouterState(lastGoRouterState);
    final redirect = GoRouterRedirector.instance.redirect(
      routeState: routeState,
      appState: appState,
    );
    _redirections.add(redirect);
    return redirect;
  }

  final AppBloc _appBloc;

  /// Cache of the last known [GoRouterState].
  GoRouterState? lastGoRouterState;

  /// Inner GoRouter driving the whole show.
  late final GoRouter router;

  /// Starting place for the app.
  static GoRoute get initialRoute => Routes.splash;

  // ignore: unused_element
  void _goNamed(String name, {Params? params}) =>
      router.goNamed(name, pathParameters: params ?? {});

  // ignore: unused_element
  void _pushNamed(String name, {Params? params}) =>
      router.pushNamed(name, pathParameters: params ?? {});

  /// Navigates the app to the given page.
  void goTo(String path) => router.go(path);

  /// Adds the onboarding screen to the navigation stack. This is pushed to
  /// preserve the user's ability to go backward.
  void pushOnboarding() => _pushNamed(Routes.onboarding.name!);

  /// Adds the login screen to the navigation stack. This is pushed to
  /// preserve the user's ability to go backward.
  void pushLogin() => _pushNamed(Routes.login.name!);
}

/// {@template GoRouterRefreshStream}
/// {@endtemplate}
class GoRouterRefreshStream extends ChangeNotifier {
  /// {@macro GoRouterRefreshStream}
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
