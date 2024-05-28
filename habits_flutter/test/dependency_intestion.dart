import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:mockito/mockito.dart';

class _MockClient extends Fake implements Client {}

void setUpTestDI({
  String apiBaseUrl = 'https://fake.com/',
  Client? client,
}) {
  GetIt.I.registerSingleton<BaseAppConfigRepository>(FakeAppConfigRepository());
  GetIt.I.registerSingleton<RequestDelegate>(RequestDelegate.fake());
  GetIt.I.registerSingleton<IAppConfigService>(FakeAppConfigService());
  GetIt.I.registerSingleton<BaseSocialAuth>(FakeStreamAuth());
  GetIt.I.registerSingleton<BaseRestAuth<AuthUser>>(FakeRestAuth());
  GetIt.I.registerSingleton<BaseAuthRepository<AuthUser>>(FakeAuthRepository());
  GetIt.I.registerSingleton<AppDetails>(
    AppDetails.live(apiBaseUrl: apiBaseUrl, env: Environment.test),
  );
  GetIt.I.registerSingleton<Client>(client ?? _MockClient());

  setUpDI(apiBaseUrl: apiBaseUrl);
}
