import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

/// Sets up non-testing dependency injection. This means production or local
/// development.
void setUpLiveDI({required String apiBaseUrl, required Environment env}) {
  GetIt.I.registerSingleton<IAppConfigService>(FakeAppConfigService());
  GetIt.I.registerSingleton<AppDetails>(AppDetails.fake());
  setUpDI(
    apiBaseUrl: apiBaseUrl,
  );
}

/// Shared/common setup between tests and live runs.
void setUpDI({
  required String apiBaseUrl,
  AppConfigRepository? appConfigRepository,
  AppBloc? appBloc,
}) {
  GetIt.I.registerSingleton<Client>(
    Client(
      apiBaseUrl,
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor(),
  );

  GetIt.I.registerSingleton<SessionManager>(
    SessionManager(
      caller: GetIt.I<Client>().modules.auth,
    ),
  );

  GetIt.I.registerSingleton<RestApi>(
    RestApi(
      apiBaseUrl: apiBaseUrl,
      headersBuilder: GetIt.I.get<AppDetails>().getDefaultHeaders,
      delegate: GetIt.I.get<RequestDelegate>(),
    ),
  );

  GetIt.I.registerSingleton<AppConfigRepository>(
    appConfigRepository ??
        AppConfigRepository(
          details: GetIt.I<AppDetails>(),
          service: GetIt.I<IAppConfigService>(),
        ),
  );
  GetIt.I.registerSingleton<AppBloc>(
    appBloc ??
        AppBloc(
          appConfigRepository: GetIt.I<AppConfigRepository>(),
          authRepository: GetIt.I<AuthRepository<AuthUser>>(),
        ),
  );
  GetIt.I.registerSingleton<AppRouter>(
    AppRouter(GetIt.I<AppBloc>()),
  );
}
