import 'dart:math';
import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Callable endpoints for accounts with "anonymous" sessions.
class AppAuthEndpoint extends Endpoint {
  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  Future<AppAuthResponse> createAnonymous(
    Session session, {
    required String userIdentifier,
  }) async =>
      AnonymousUserController.createAccount(
        AppSession(session),
        userIdentifier: userIdentifier,
        key: Random().nextString(),
      );

  /// Verifies the [keyIdentifier] for an "anonymous" sesion.
  Future<AppAuthResponse> checkSession(
    Session session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    final appSession = AppSession(session);
    // TODO(craiglabenz): If this returns a failure, add other session checkers.
    return AnonymousUserController.checkSession(
      appSession,
      keyIdentifier: keyIdentifier,
    );
  }

  /// Adds email-flavored auth to the authenticated session.
  Future<AppAuthResponse> addEmailAuth(
    Session session, {
    required String email,
    required String password,
  }) async {
    final appSession = AppSession(session);
    final authInfo = await appSession.authenticated;
    if (authInfo == null) {
      return const AppAuthFailure(AuthenticationError.missingApiKey);
    }
    return EmailUserController.addAuth(
      appSession,
      email: email,
      password: password,
    );
  }

  /// Loads an existing session off an email and password combination.
  Future<AppAuthResponse> loginWithEmailAndPassword(
    Session session, {
    required String email,
    required String password,
  }) async {
    final appSession = AppSession(session);
    final authInfo = await appSession.authenticated;
    if (authInfo != null) {
      appSession.log('Unexpectly logging in ${authInfo.userId}');
    }
    return EmailUserController.login(
      appSession,
      email: email,
      password: password,
    );
  }
}
