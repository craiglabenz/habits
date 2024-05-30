import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_client/habits_client.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/auth/auth.dart';
import 'package:habits_flutter/core/core.dart';
import 'package:habits_flutter/data/data.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

/// Sets up non-testing dependency injection. This means production or local
/// development.
void setUpLiveDI({
  required String apiBaseUrl,
  required Environment env,
  AppConfigRepository? appConfigRepository,
}) {
  GetIt.I.registerSingleton<IAppConfigService>(FakeAppConfigService());
  GetIt.I.registerSingleton<AppDetails>(AppDetails.fake());

  GetIt.I.registerLazySingleton<TimezoneRepository>(TimezoneRepository.new);
  GetIt.I.registerLazySingleton<SessionUserRepository>(
    SessionUserRepository.new,
  );

  // SERVERPOD
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

  // AUTH
  GetIt.I.registerLazySingleton<BaseRestAuth<AuthUser>>(
    ServerpodAuthService<AuthUser, String>.new,
  );
  GetIt.I.registerLazySingleton<BaseSocialAuth>(FirebaseAuthService.new);
  GetIt.I.registerLazySingleton<BaseAuthRepository<AuthUser>>(
    AuthRepository.new,
  );

  // APP-WIDE
  GetIt.I.registerSingleton<BaseAppConfigRepository>(
    appConfigRepository ??
        AppConfigRepository(
          details: GetIt.I<AppDetails>(),
          service: GetIt.I<IAppConfigService>(),
        ),
  );

  // CORE DI
  setUpDI(
    apiBaseUrl: apiBaseUrl,
  );
}

/// Shared/common setup between tests and live runs.
void setUpDI({
  required String apiBaseUrl,
  AppBloc? appBloc,
}) {
  // AUTH
  GetIt.I.registerSingleton<AuthBindings<AuthUser, String>>(
    const AuthUserBindings(),
  );

  // GetIt.I.registerSingleton<RestApi>(
  //   RestApi(
  //     apiBaseUrl: apiBaseUrl,
  //     headersBuilder: GetIt.I.get<AppDetails>().getDefaultHeaders,
  //     delegate: GetIt.I.get<RequestDelegate>(),
  //   ),
  // );

  // APP-WIDE
  GetIt.I.registerSingleton<AppBloc>(
    appBloc ??
        AppBloc(
          appConfigRepository: GetIt.I<BaseAppConfigRepository>(),
          authRepository: GetIt.I<BaseAuthRepository<AuthUser>>(),
        ),
  );
  GetIt.I.registerSingleton<AppRouter>(
    AppRouter(GetIt.I<AppBloc>()),
  );
}
