import 'dart:math';

import 'package:habits_server/src/generated/protocol.dart';
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
    bool allowEmptyUsername = false,
  }) async {
    final existingAccount = await session.db.findFirstRow<auth.UserInfo>(
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
    if (!allowEmptyUsername && username.isEmpty) {
      session.log('Username must not be empty', level: LogLevel.error);
      return auth.AuthenticationResponse(
        success: false,
        failReason: auth.AuthenticationFailReason.invalidCredentials,
      );
    }

    final userInfo = await auth.Users.createUser(
      session,
      auth.UserInfo(
        // FirebaseUser.uid
        userIdentifier: userIdentifier,
        // Name of the person, which will be saved after this account is ready.
        userName: username,
        created: DateTime.now(),
        scopeNames: [],
        blocked: false,
      ),
      AnonymousUser.methodName,
    );

    if (userInfo == null) {
      session.log(
        'Failed to create new user for userIdentifier :: $userIdentifier',
        level: LogLevel.error,
      );
      return auth.AuthenticationResponse(
        success: false,
        failReason: auth.AuthenticationFailReason.internalError,
      );
    }

    // Create the resource that the client will use to access this session.
    final key = Random().nextString();
    var signInSalt = session.passwords['authKeySalt'] ?? defaultAuthKeySalt;
    AuthKey authKey = AuthKey(
      userId: userInfo.id!,
      key: key,
      hash: hashString(key, signInSalt),
      method: AnonymousUser.methodName,
      scopeNames: [],
    );

    // Save the authentication key to the database in a separate session which
    // has logging disabled for security purposes.
    var tempSession = await session.serverpod.createSession(
      enableLogging: false,
    );
    authKey = await tempSession.db.insertRow<AuthKey>(authKey);
    await tempSession.close();

    final now = DateTime.now();
    await session.db.insertRow<User>(
      User(
        id: userInfo.id!,
        userInfoId: userInfo.id!,
        uid: UuidValue.fromString(Uuid().v4()),
        name: username,
        createdAt: now,
        updatedAt: now,
      ),
    );

    return auth.AuthenticationResponse(
      success: true,
      userInfo: userInfo,
      key: authKey.key,
      keyId: authKey.id,
    );
  }
}
