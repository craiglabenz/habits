import 'package:habits_server/src/business/business.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class AppAuthEndpoint extends Endpoint {
  /// Creates an initial anonymous account which a user may or may not later
  /// upgrade.
  Future<auth.AuthenticationResponse> createAnonymous(
    Session session, {
    required String userIdentifier,
    required String username,
  }) async {
    return await AnonymousUser.createAccount(
      session,
      userIdentifier: userIdentifier,
      username: username,
    );
  }
}
