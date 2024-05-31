import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';

void main() {
  AppBloc getAppBloc([BaseAuthRepository<AuthUser>? authRepo]) => AppBloc(
        appConfigRepository: AppConfigRepository(
          service: FakeAppConfigService(),
          details: AppDetails.fake(),
        ),
        authRepository: authRepo ?? FakeAuthRepository(),
      );

  group('AppBloc should', () {
    FakeAuthRepository? authRepo;
    const user = AuthUser(apiKey: 'abc', id: 'id', method: AuthType.anonymous);

    setUp(() => authRepo = FakeAuthRepository());

    blocTest<AppBloc, AppState>(
      'emits a state with the new user when the new user changes',
      build: () => getAppBloc(authRepo),
      act: (bloc) => authRepo!.publishNewUser(user, false),
      expect: () => const <AppState>[AppState(user: user)],
    );

    blocTest<AppBloc, AppState>(
      'emits states with new users when the new user changes',
      build: () => getAppBloc(authRepo),
      act: (bloc) async {
        authRepo!.publishNewUser(user, false);
        await Future.delayed(const Duration(milliseconds: 1), () {});
        authRepo!.publishNewUser(AuthUser.unknown, false);
      },
      expect: () => const <AppState>[
        AppState(user: user),
        AppState(user: AuthUser.unknown),
      ],
    );
  });
}
