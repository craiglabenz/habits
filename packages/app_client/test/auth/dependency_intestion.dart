// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_client/app_client.dart';
import 'package:app_client/src/auth/test/test.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

/// Bootstraps a runtime for unit tests.
Future<void> setUpTestingDI({
  RequestDelegate? requestDelegate,
  TargetPlatform? targetPlatform,
}) async {
  await GetIt.I.reset();
  GetIt.I.registerSingleton<BaseSocialAuth>(FakeStreamAuth());
  GetIt.I.registerSingleton<BaseRestAuth<AuthUser>>(FakeRestAuth());

  GetIt.I.registerSingleton<RequestDelegate>(
    requestDelegate ?? RequestDelegate.fake(),
  );
  if (targetPlatform != null) {
    GetIt.I.registerSingleton<TargetPlatform>(targetPlatform);
  }
  GetIt.I.registerSingleton<BaseAuthRepository<AuthUser>>(
    AuthRepository(),
  );
}
