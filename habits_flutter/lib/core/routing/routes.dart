import 'package:go_router/go_router.dart';
import 'package:habits_flutter/screens/screens.dart';

/// Static namespace which holds all routes within the app.
class Routes {
  /// First page to show while the app is warming up.
  static final GoRoute splash = GoRoute(
    name: 'splash',
    path: '/splash',
    builder: (context, state) => SplashScreen(key: state.pageKey),
  );

  /// First page to show once we have concluded that the user is unknown.
  /// Includes links to login or register.
  static final GoRoute welcome = GoRoute(
    name: 'welcome',
    path: '/welcome',
    builder: (context, state) => WelcomeScreen(key: state.pageKey),
  );

  /// Home route which a user should settle on after successfully logging in or
  /// validating an existing session.
  static final GoRoute home = GoRoute(
    name: 'home',
    path: '/',
    // pageBuilder: (context, state) => CounterPage.page(key: state.pageKey),
  );

  /// Screen to inform users that the app is down for scheduled maintenance.
  static final GoRoute maintenance = GoRoute(
    name: 'maintenance',
    path: '/maintenance',
    builder: (context, state) => MaintenanceScreen(key: state.pageKey),
  );

  /// Screen to inform a user that they must download the latest version.
  static final GoRoute upgrade = GoRoute(
    name: 'upgrade',
    path: '/upgrade',
    builder: (context, state) => UpgradeScreen(key: state.pageKey),
  );
}
