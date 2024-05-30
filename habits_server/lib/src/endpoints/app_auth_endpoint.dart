import 'package:habits_server/src/business/business.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class AppAuthEndpoint extends Endpoint {
  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  Future<auth.AuthenticationResponse> createAnonymous(
    Session session, {
    required String userIdentifier,
  }) async {
    return await AnonymousUser.createAccount(
      session,
      userIdentifier: userIdentifier,
    );
  }

  Future<auth.AuthenticationResponse> checkSession(
    Session session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    // TODO(craiglabenz): If this returns a failure, add other session checkers.
    return AnonymousUser.checkSession(session, keyIdentifier: keyIdentifier);
  }
}
