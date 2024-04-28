import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod/protocol.dart';
// ignore: implementation_imports
import 'package:serverpod/src/authentication/util.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class AnonymousUser {
  static const methodName = 'anonymous';

  /// Creates a new anonymous account.
  static Future<auth.AuthenticationResponse> createAccount(
    Session session, {
    required String userIdentifier,
    required String username,
  }) async {
    final existingAccount = await session.dbNext.findFirstRow<auth.UserInfo>(
      where: auth.UserInfo.t.userIdentifier.equals(userIdentifier),
    );

    if (existingAccount != null) {
      session.log(
        'Unable to create anonymous account for existing '
        'userIdentifier :: $userIdentifier',
        level: LogLevel.error,
      );
      return auth.AuthenticationResponse(
        success: false,
        failReason: auth.AuthenticationFailReason.userCreationDenied,
      );
    }

    username = username.trim();
    if (username.isEmpty) {
      session.log('Username must not be empty', level: LogLevel.error);
      return auth.AuthenticationResponse(
        success: false,
        failReason: auth.AuthenticationFailReason.invalidCredentials,
      );
    }

    final user = await auth.Users.createUser(
      session,
      auth.UserInfo(
        // Firebase.uid
        userIdentifier: userIdentifier,
        // Name of the person we asked for in the onboarding flow
        userName: username,
        created: DateTime.now(),
        scopeNames: [],
        blocked: false,
      ),
      AnonymousUser.methodName,
    );

    if (user == null) {
      session.log(
        'Failed to create new user for userIdentifier :: $userIdentifier',
        level: LogLevel.error,
      );
      return auth.AuthenticationResponse(
        success: false,
        failReason: auth.AuthenticationFailReason.internalError,
      );
    }

    final key = Random().nextString();
    var signInSalt = session.passwords['authKeySalt'] ?? defaultAuthKeySalt;
    AuthKey authKey = AuthKey(
      userId: user.id!,
      key: key,
      hash: hashString(key, signInSalt),
      method: AnonymousUser.methodName,
      scopeNames: [],
    );

    // Get the authentication key from the database
    var tempSession = await session.serverpod.createSession(
      enableLogging: false,
    );
    authKey = await tempSession.dbNext.insertRow<AuthKey>(authKey);
    await tempSession.close();

    return auth.AuthenticationResponse(
      success: true,
      userInfo: user,
      key: authKey.key,
      keyId: authKey.id,
    );
  }
}
