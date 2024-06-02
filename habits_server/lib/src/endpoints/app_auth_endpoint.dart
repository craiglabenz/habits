import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:serverpod/serverpod.dart';

class AppAuthEndpoint extends Endpoint {
  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  Future<AppAuthResponse> createAnonymous(
    Session session, {
    required String userIdentifier,
  }) async {
    return await AnonymousUserController.createAccount(
      AppSession(session),
      userIdentifier: userIdentifier,
    );
  }

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
}
