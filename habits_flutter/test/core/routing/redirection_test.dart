import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';

import '../../dependency_intestion.dart';

void main() {
  group('AppRouter should', () {
    setUp(setUpTestDI);

    tearDown(() async => GetIt.I.reset());

    testWidgets(
      'redirect to maintenance when the AppState signals as much',
      (tester) async {
        await tester.runAsync(() async {
          final expectation = expectLater(
            GetIt.I<AppRouter>().redirects,
            emitsInOrder([
              // First non-redirect for staying on the splash page
              null,
              // Redirect when the maintenance signal arrives
              Routes.maintenance.path,
              // Second non-redirect when the maintenance signal has stuck
              null,
            ]),
          );

          await tester.pumpWidget(
            const AppView(),
          );
          GetIt.I<BaseAppConfigRepository>().publishRequiredMaintenance();

          await expectation;
          expect(
            GetIt.I<AppRouter>().lastGoRouterState!.fullPath,
            Routes.maintenance.path,
          );
        });
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    testWidgets(
      'redirect to upgrade page when the AppState signals as much',
      (tester) async {
        await tester.runAsync(() async {
          final expectation = expectLater(
            GetIt.I<AppRouter>().redirects,
            emitsInOrder([
              // First non-redirect for staying on the splash page
              null,
              // Redirect when the upgrade signal arrives
              Routes.upgrade.path,
              // Second non-redirect when the upgrade signal has stuck
              null,
            ]),
          );

          await tester.pumpWidget(
            const AppView(),
          );
          GetIt.I<BaseAppConfigRepository>()
              .publishUpgradeStatus(ForceUpgrade.yes('url'));
          await expectation;
          expect(
            GetIt.I<AppRouter>().lastGoRouterState!.fullPath,
            Routes.upgrade.path,
          );
        });
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    testWidgets(
      'redirect to onboarding page when a new user is emitted',
      (tester) async {
        await tester.runAsync(() async {
          final expectation = expectLater(
            GetIt.I<AppRouter>().redirects,
            emitsInOrder([
              // First non-redirect for staying on the splash page
              null,
              // // Then to /welcome
              Routes.welcome.path,
              // Then to stay on /welcome
              null,
              // Then to /onboarding
              Routes.onboarding.path,
            ]),
          );

          await tester.pumpWidget(
            const AppView(),
          );

          // Kick off a no-user situation
          (GetIt.I<BaseAuthRepository<AuthUser>>() as FakeAuthRepository)
              .setAsInitialized();

          // Commenting out this section would remove the /welcome part of the
          // redirection test
          await tester.pumpWidget(
            const AppView(),
          );

          (GetIt.I<BaseAuthRepository<AuthUser>>() as FakeAuthRepository)
              .publishNewUser(const AuthUser(id: 'id', apiKey: 'abc'), true);

          await expectation;
        });
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );

    testWidgets(
      'redirect to home page when an existing user is emitted',
      (tester) async {
        await tester.runAsync(() async {
          final expectation = expectLater(
            GetIt.I<AppRouter>().redirects,
            emitsInOrder([
              // First non-redirect for staying on the splash page
              null,
              // // Then to /welcome
              Routes.welcome.path,
              // Then to stay on /welcome
              null,
              // Then to /onboarding
              Routes.home.path,
            ]),
          );

          await tester.pumpWidget(
            const AppView(),
          );

          // Kick off a no-user situation
          (GetIt.I<BaseAuthRepository<AuthUser>>() as FakeAuthRepository)
              .setAsInitialized();

          // Commenting out this section would remove the /welcome part of the
          // redirection test
          await tester.pumpWidget(
            const AppView(),
          );

          (GetIt.I<BaseAuthRepository<AuthUser>>() as FakeAuthRepository)
              .publishNewUser(const AuthUser(id: 'id', apiKey: 'abc'), false);

          await expectation;
        });
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );
  });
}
