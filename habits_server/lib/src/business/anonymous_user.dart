import 'dart:math';

import 'package:habits_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
// ignore: implementation_imports
import 'package:serverpod_auth_server/src/business/authentication_util.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AnonymousUser {
  static const methodName = 'anonymous';

  /// Creates a new anonymous account.
  static Future<auth.AuthenticationResponse> createAccount(
    Session session, {
    required String userIdentifier,
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

    final userInfo = await auth.Users.createUser(
      session,
      auth.UserInfo(
        // FirebaseUser.uid
        userIdentifier: userIdentifier,
        // Name of the person, which will be saved after this account is ready.
        userName: '',
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
      hash: hashString(signInSalt, key),
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
        name: '',
        createdAt: now,
        updatedAt: now,
      ),
    );

    return auth.AuthenticationResponse(
      success: true,
      userInfo: userInfo,
      key: key,
      keyId: authKey.id,
    );
  }

  /// Checks the validity of an existing session.
  static Future<auth.AuthenticationResponse> checkSession(
    Session session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    if (keyIdentifier == '') {
      session.log('Unexpected empty keyIdentifier');
      return auth.AuthenticationResponse(
        success: false,
        failReason: AuthenticationFailReason.invalidCredentials,
      );
    }
    final [String keyIdStr, String keyValue] = keyIdentifier.split(':');

    int? keyId = int.tryParse(keyIdStr);
    if (keyId == null) {
      session.log('Invalid keyId - must be integer');
      return auth.AuthenticationResponse(
        success: false,
        failReason: AuthenticationFailReason.invalidCredentials,
      );
    }

    final authKey = await session.db.findFirstRow<AuthKey>(
      where: AuthKey.t.id.equals(keyId),
    );

    if (authKey == null) {
      session.log('Unknown keyId $keyId');
      return auth.AuthenticationResponse(
        success: false,
        failReason: AuthenticationFailReason.invalidCredentials,
      );
    }

    var signInSalt = session.passwords['authKeySalt'] ?? defaultAuthKeySalt;
    final hash = hashString(signInSalt, keyValue);
    if (authKey.hash != hash) {
      session.log('Hash "$hash" is incorrect for Key Id $keyId');
      return auth.AuthenticationResponse(
        success: false,
        failReason: AuthenticationFailReason.invalidCredentials,
      );
    }

    final userInfo = await session.db.findFirstRow<auth.UserInfo>(
      where: auth.UserInfo.t.id.equals(authKey.userId),
    );

    return auth.AuthenticationResponse(
      success: true,
      userInfo: userInfo,
      key: keyValue,
      keyId: authKey.id,
    );
  }
}
