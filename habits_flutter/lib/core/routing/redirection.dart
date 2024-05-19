import 'package:go_router/go_router.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:logging/logging.dart';

final _log = Logger('Redirection');

/// {@template GoRouterRedirector}
/// Validates that the user's current location within the app is allowed by
/// their authentication state and other details like app health.
/// {@endtemplate}
class GoRouterRedirector {
  /// {@macro GoRouterRedirector}
  const GoRouterRedirector(this._redirects);
  final List<Redirector> _redirects;

  /// Forced dead-end paths that, once routed to, cannot be routed away from by
  /// any other redirect rules; but instead, only by the undoing of the
  /// conditions that led to redirecting here in the first place.
  static final doNotLeave = <String>[
    Routes.maintenance.path,
    Routes.upgrade.path,
  ];

  /// Logging wrapper to easily turn on logging during tests.
  static void log(String message, [Level level = Level.INFO]) {
    // ignore: avoid_print
    // print('[${_log.name}][${level.name}] $message');
    _log.log(level, message);
  }

  /// Singleton instance of the [GoRouterRedirector]. This class is always
  /// stateless, so there is no value in ever having separate instances.
  static const GoRouterRedirector instance = GoRouterRedirector([
    ForceUpgradeRedirector(),
    MaintenanceRedirector(),
    // StayOnSplash(),
    UnauthenticatedToWelcome(),
    NewUsersToOnboarding(),
    // AuthenticatedUsersAwayFromWelcome(),
    // AuthenticatedUsersAwayFromSignUp(),
    // AuthenticatedUsersAwayFromLogin(),
    // AuthenticatedUsersAwayFromOnboarding(),
    AuthenticatedUsersAwayFromSplash(),
  ]);

  /// Compares the current [RouteState] against the [AppState] and returns a
  /// string to navigate to if required. Returns null if the current
  /// [RouteState] and [AppState] are compatible.
  String? redirect({
    required RouteState routeState,
    required AppState appState,
  }) {
    GoRouterRedirector.log(
      'Considering redirect for ${routeState.path} with user ${appState.user}',
      Level.FINE,
    );
    if (GoRouterRedirector.doNotLeave.contains(routeState.path)) {
      GoRouterRedirector.log(
        'Not navigating away from ${routeState.path} for DO NOT LEAVE',
        Level.FINEST,
      );
      return null;
    }
    final current = Uri(
      path: routeState.path,
      queryParameters: routeState.uri.queryParameters.isNotEmpty //
          ? routeState.uri.queryParameters
          : null,
    );
    for (final redirect in _redirects) {
      if (redirect.predicate(routeState, appState)) {
        final uri = redirect.getNewUri(routeState, appState);
        if (uri != null) {
          final uriString = uri.toString();

          if (uriString == current.toString()) {
            // ignore: avoid_print
            GoRouterRedirector.log(
              '$redirect attempted to redirect to itself at $uriString. '
              'This should have been caught earlier!',
              Level.WARNING,
            );
            continue;
          }

          // ignore: avoid_print
          GoRouterRedirector.log(
            '$redirect redirecting from $current to $uriString',
            Level.FINE,
          );
          return uriString;
        }
      }
    }
    GoRouterRedirector.log(
      'Not redirecting away from ${routeState.path}',
      Level.FINER,
    );
    return null;
  }
}

/// {@template RouteState}
/// Simplified representation of the user's location within the app. Exists to
/// contain an individual routing solution from leaking its logic all across
/// the app's codebase.
/// {@endtemplate}
class RouteState {
  /// {@macro RouteState}
  const RouteState({
    required this.uri,
    required this.name,
    required this.path,
    this.pathParameters = const {},
  });

  /// Real constructor which distills a [GoRouterState] object into the values
  /// the reconst st of our app will care about.
  factory RouteState.fromGoRouterState(GoRouterState? state) =>
      state != null && state.fullPath != null
          ? //
          RouteState(
              uri: state.uri,
              name: state.name,
              path: state.fullPath!,
              pathParameters: state.pathParameters,
            )
          : RouteState.initial();

  /// Builds a GoRouterState value from a given route.
  /// Useful for the initial route.
  factory RouteState.fromRoute(GoRoute route, {Params? pathParameters}) {
    String path = route.path;
    if (pathParameters != null) {
      for (final key in pathParameters.keys) {
        path = path.replaceAll(':$key', pathParameters[key]!);
      }
    }
    return RouteState(
      uri: Uri(path: path),
      path: route.path,
      name: route.name,
      pathParameters: pathParameters ?? {},
    );
  }

  /// Initial RouteState for the start of the app.
  factory RouteState.initial() => RouteState.fromRoute(AppRouter.initialRoute);

  /// The full location of the route, e.g. /family/f2/person/p1
  final Uri uri;

  /// The optional name of the route.
  final String? name;

  /// The path to this sub-route, e.g. family/:fid/person/:pid
  final String path;

  /// Optional values to turn [path] into [uri].
  final Params pathParameters;

  @override
  String toString() => //
      'RouteState(uri: $uri, name: $name, path: $path, '
      'pathParameters: $pathParameters)';
}

/// Individual utility within a [GoRouterRedirector] to enforce a single rule.
abstract class Redirector {
  /// Const constructor.
  const Redirector();

  /// Determines whether this redirection should take place.
  bool predicate(RouteState routeState, AppState appState);

  /// Returns an optional [Uri] instance if there is a redirect. This
  /// can return null because [predicate] may return true if it knows there is
  /// zero chance any future redirect should be checked. For example, if the
  /// app is not initialized, you may know that your only possible redirect is
  /// *to* the splash screen. However, if you are already there, [getNewUri]
  /// will return null.
  Uri? getNewUri(RouteState routeState, AppState appState);

  @override
  String toString() => '$runtimeType()';
}

/// {@template ForceUpgradeRedirector}
/// Forces users to the upgrade screen when their app is too far behind.
/// {@endtemplate}
class ForceUpgradeRedirector extends Redirector {
  /// {@macro ForceUpgradeRedirector}
  const ForceUpgradeRedirector();
  @override
  Uri? getNewUri(RouteState routeState, AppState appState) =>
      Uri(path: Routes.upgrade.path);

  @override
  bool predicate(RouteState routeState, AppState appState) =>
      appState.isUpgradeRequired;
}

/// {@template ForceUpgradeRedirector}
/// Forces users to the upgrade screen when their app is too far behind.
/// {@endtemplate}
class MaintenanceRedirector extends Redirector {
  /// {@macro MaintenanceRedirector}
  const MaintenanceRedirector();
  @override
  Uri? getNewUri(RouteState routeState, AppState appState) =>
      Uri(path: Routes.maintenance.path);

  @override
  bool predicate(RouteState routeState, AppState appState) =>
      appState.isDownForMaintenance;
}

// class StayOnSplash extends Redirector {
//   const StayOnSplash();
//   @override
//   bool predicate(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       // If `isUserUnknown == true`, that means we haven't completed initial
//       // checks. If that's the case, and we're on the SplashPage, then we're
//       // exactly where we're supposed to be.
//       appState.isUserUnknown &&
//        routeState.path!.endsWith(Routes.splash.path);

//   @override
//   Uri? getNewUri(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       null;
// }

/// {@template UnauthenticatedToWelcome}
/// Detects completely unknown sessions and routes them to the welcome page,
/// from which a user can login or instantly create an anonymous account.
/// {@endtemplate}
class UnauthenticatedToWelcome extends Redirector {
  /// {@macro UnauthenticatedToWelcome}
  const UnauthenticatedToWelcome();
  @override
  bool predicate(
    RouteState routeState,
    AppState appState,
  ) =>
      !routeState.path.endsWith(Routes.welcome.path) &&
      // !routeState.path.endsWith(Routes.login.path) &&
      // !routeState.path.endsWith(Routes.signUp.path) &&
      appState.isAnonymous;

  @override
  Uri? getNewUri(
    RouteState routeState,
    AppState appState,
  ) =>
      Uri(path: Routes.welcome.path);
}

/// {@template NewUsersToOnboarding}
/// Sends brand new user sessions to the onboarding flow.
/// {@endtemplate}
class NewUsersToOnboarding extends Redirector {
  /// {@macro NewUsersToOnboarding}
  const NewUsersToOnboarding();
  @override
  bool predicate(
    RouteState routeState,
    AppState appState,
  ) {
    GoRouterRedirector.log(
      'appState.isNewUser::${appState.isNewUser}',
      Level.FINEST,
    );
    // Redirect authenticated but new users to the Onboarding page.
    return !routeState.path.contains(Routes.onboarding.path) &&
        appState.isNewUser;
  }

  @override
  Uri? getNewUri(
    RouteState routeState,
    AppState appState,
  ) =>
      Uri(path: Routes.onboarding.path);
}

// class AuthenticatedUsersAwayFromWelcome extends Redirector {
//   const AuthenticatedUsersAwayFromWelcome();
//   @override
//   bool predicate(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isAuthenticated && routeState.path! == Routes.welcome.path;

//   @override
//   Uri? getNewUri(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isNewUser
//           ? Uri(path: Routes.onboardingStart.path)
//           : Uri(path: Routes.home.path);
// }

// class AuthenticatedUsersAwayFromSignUp extends Redirector {
//   const AuthenticatedUsersAwayFromSignUp();
//   @override
//   bool predicate(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isAuthenticated && routeState.path! == Routes.signUp.path;

//   @override
//   Uri? getNewUri(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isNewUser
//           ? Uri(path: Routes.onboardingStart.path)
//           : Uri(path: Routes.home.path);
// }

// class AuthenticatedUsersAwayFromLogin extends Redirector {
//   const AuthenticatedUsersAwayFromLogin();
//   @override
//   bool predicate(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isAuthenticated && routeState.path! == Routes.login.path;

//   @override
//   Uri? getNewUri(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       appState.isNewUser
//           ? Uri(path: Routes.onboardingStart.path)
//           : Uri(path: Routes.home.path);
// }

// class AuthenticatedUsersAwayFromOnboarding extends Redirector {
//   const AuthenticatedUsersAwayFromOnboarding();
//   @override
//   bool predicate(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       // false &&
//       appState.isAuthenticated &&
//       !appState.isNewUser &&
//       routeState.path! == Routes.onboardingStart.path;

//   @override
//   Uri? getNewUri(
//     RouteState routeState,
//     AppState appState,
//   ) =>
//       Uri(path: Routes.home.path);
// }

/// {@template AuthenticatedUsersAwayFromSplash}
/// Moves authenticated users away from the Splash page and to the Home page.
/// {@endtemplate}
class AuthenticatedUsersAwayFromSplash extends Redirector {
  /// {@macro AuthenticatedUsersAwayFromSplash}
  const AuthenticatedUsersAwayFromSplash();
  @override
  bool predicate(
    RouteState routeState,
    AppState appState,
  ) =>
      appState.isAuthenticated &&
      !appState.isNewUser &&
      routeState.path == Routes.splash.path;

  @override
  Uri? getNewUri(
    RouteState routeState,
    AppState appState,
  ) =>
      Uri(path: Routes.home.path);
}
