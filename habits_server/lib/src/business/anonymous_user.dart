import 'dart:math';

import 'package:habits_server/src/generated/protocol.dart';
import 'package:app_shared/app_shared.dart' as shared;
import 'package:serverpod/serverpod.dart';
// ignore: implementation_imports
import 'package:serverpod_auth_server/src/business/authentication_util.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

class AnonymousUser {
  static const methodName = 'anonymous';

  /// Creates a new anonymous account.
  static Future<shared.AppAuthResponse> createAccount(
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
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.accountExists(
          fieldName: 'userIdentifier',
          value: userIdentifier,
        ),
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
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.unknownError(),
      );
    }

    // Create the resource that the client will use to access this session.
    final key = Random().nextString();
    var signInSalt = session.passwords['authKeySalt'] ?? defaultAuthKeySalt;
    auth.AuthKey authKey = auth.AuthKey(
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
    authKey = await tempSession.db.insertRow<auth.AuthKey>(authKey);
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

    return shared.AppAuthSuccess(
      userInfoData: userInfo.toJson(),
      key: key,
      keyId: authKey.id!,
      method: shared.AuthType.anonymous,
      allMethods: [shared.AuthType.anonymous],
    );
  }

  /// Checks the validity of an existing session.
  static Future<shared.AppAuthResponse> checkSession(
    Session session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    if (keyIdentifier == '') {
      session.log('Unexpected empty keyIdentifier');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.missingCredentials(
          missingEmail: false,
          missingPassword: false,
          missingApiKey: true,
        ),
      );
    }
    final [String keyIdStr, String keyValue] = keyIdentifier.split(':');

    int? keyId = int.tryParse(keyIdStr);
    if (keyId == null) {
      session.log('Invalid keyId - must be integer. Value was "$keyIdStr"');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.missingCredentials(
          missingEmail: false,
          missingPassword: false,
          missingApiKey: true,
        ),
      );
    }

    final authKey = await session.db.findFirstRow<auth.AuthKey>(
      where: auth.AuthKey.t.id.equals(keyId),
    );

    if (authKey == null) {
      session.log('Unknown keyId $keyId');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    var signInSalt = session.passwords['authKeySalt'] ?? defaultAuthKeySalt;
    final hash = hashString(signInSalt, keyValue);
    if (authKey.hash != hash) {
      session.log('Hash "$hash" is incorrect for Key Id $keyId');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    final userInfo = await session.db.findFirstRow<auth.UserInfo>(
      where: auth.UserInfo.t.id.equals(authKey.userId),
    );

    if (userInfo == null) {
      session.log('AuthKey $keyId pointed to missing UserInfo. Deleting key.');
      session.db.deleteRow<auth.AuthKey>(authKey);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    final allKeys = await session.db.find<auth.AuthKey>(
      where: auth.AuthKey.t.userId.equals(authKey.userId),
    );

    return shared.AppAuthSuccess(
      userInfoData: userInfo.toJson(),
      key: keyValue,
      keyId: authKey.id!,
      method: shared.AuthType.fromJson(authKey.method),
      allMethods: allKeys
          .map<shared.AuthType>((key) => shared.AuthType.fromJson(key.method))
          .toList(),
    );
  }
}
