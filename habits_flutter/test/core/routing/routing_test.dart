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
          // final appRouter = AppRouter(appBloc);
          final expectation = expectLater(
            GetIt.I<AppRouter>().redirects,
            // appRouter.redirects,
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
          // final appRouter = AppRouter(appBloc);
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
  });
}
