import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
// import 'package:habits_flutter/theme_selector/theme_selector.dart';

/// {@template AppDependencies}
/// {@endtemplate}
class AppDependencies {
  /// {@macro AppDependencies}
  factory AppDependencies() => AppDependencies._(
        appBloc: GetIt.I<AppBloc>(),
        appConfigRepository: GetIt.I<AppConfigRepository>(),
        // appRouter: GetIt.I<ApplicationRouter>(),
        // appStoreReviewBloc: GetIt.I<AppStoreReviewBloc>(),
        authRepository: GetIt.I<AuthRepository<AuthUser>>(),
        // navigationCubit: GetIt.I<NavigationCubit>(),
        targetPlatform: GetIt.I.isRegistered<TargetPlatform>()
            ? GetIt.I<TargetPlatform>()
            : null,
        // themeModeBloc: GetIt.I<ThemeModeBloc>(),
      );

  AppDependencies._({
    required this.appBloc,
    required this.appConfigRepository,
    // required this.appRouter,
    // required this.appStoreReviewBloc,
    required this.authRepository,
    // required this.navigationCubit,
    required this.targetPlatform,
    // required this.themeModeBloc,
  });

  /// {@macro AppBloc}
  AppBloc appBloc;

  /// {@macro AppConfigRepository}
  AppConfigRepository appConfigRepository;

  // ApplicationRouter appRouter;
  // AppStoreReviewBloc appStoreReviewBloc;

  /// {@macro AuthRepository}
  AuthRepository<AuthUser> authRepository;

  // NavigationCubit navigationCubit;
  // ThemeModeBloc themeModeBloc;

  /// The platform currently being targeted.
  TargetPlatform? targetPlatform;
}
