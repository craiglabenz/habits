import 'package:app_client/app_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';

void main() {
  group('AppRouter should', () {
    late FakeAppConfigRepository appConfigRepo;
    late FakeAuthRepository authRepo;
    late AppBloc appBloc;

    setUp(() {
      appConfigRepo = FakeAppConfigRepository();
      authRepo = FakeAuthRepository();
      appBloc = AppBloc(
        appConfigRepository: appConfigRepo,
        authRepository: authRepo,
      );
    });

    testWidgets(
      'redirect to maintenance when the AppState signals as much',
      (tester) async {
        await tester.runAsync(() async {
          final appRouter = AppRouter(appBloc);
          final expectation = expectLater(
            appRouter.redirects,
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
            BlocProvider.value(
              value: appBloc,
              child: AppView(appRouter: appRouter),
            ),
          );
          appConfigRepo.publishRequiredMaintenance();
          await expectation;
          expect(
            appRouter.lastGoRouterState!.fullPath,
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
          final appRouter = AppRouter(appBloc);
          final expectation = expectLater(
            appRouter.redirects,
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
            BlocProvider.value(
              value: appBloc,
              child: AppView(appRouter: appRouter),
            ),
          );
          appConfigRepo.publishUpgradeStatus(ForceUpgrade.yes('url'));
          await expectation;
          expect(
            appRouter.lastGoRouterState!.fullPath,
            Routes.upgrade.path,
          );
        });
      },
      timeout: const Timeout(Duration(seconds: 1)),
    );
  });
}
