import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';

void setUpTestDI({
  String apiBaseUrl = 'https://fake.com',
}) {
  GetIt.I.registerSingleton<RequestDelegate>(RequestDelegate.fake());
  GetIt.I.registerSingleton<IAppConfigService>(FakeAppConfigService());
  GetIt.I.registerSingleton<BaseSocialAuth>(FakeStreamAuth());
  GetIt.I.registerSingleton<BaseRestAuth<AuthUser>>(FakeRestAuth());
  GetIt.I.registerSingleton<AppDetails>(
    AppDetails.live(apiBaseUrl: apiBaseUrl, env: Environment.test),
  );
  setUpDI(apiBaseUrl: apiBaseUrl);
}
