import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:serverpod/serverpod.dart';

class AppAuthEndpoint extends Endpoint {
  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  Future<AppAuthResponse> createAnonymous(
    Session session, {
    required String userIdentifier,
  }) async {
    return await AnonymousUser.createAccount(
      session,
      userIdentifier: userIdentifier,
    );
  }

  Future<AppAuthResponse> checkSession(
    Session session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    // TODO(craiglabenz): If this returns a failure, add other session checkers.
    return AnonymousUser.checkSession(session, keyIdentifier: keyIdentifier);
  }
}
