import 'dart:math';

import 'package:habits_server/src/generated/protocol.dart';
import 'package:app_shared/app_shared.dart' as shared;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import '../app_session/app_session.dart';

class AnonymousUserController {
  static const methodName = 'anonymous';

  /// Creates a new anonymous account.
  static Future<shared.AppAuthResponse> createAccount(
    AppSession session, {
    required String userIdentifier,
    required String key,
  }) async {
    final now = DateTime.now();
    final existingAccount =
        await session.userInfo.getByUserIdentifier(userIdentifier);

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

    final userInfo = await session.userInfo.insert(
      auth.UserInfo(
        // FirebaseUser.uid
        userIdentifier: userIdentifier,
        // Name of the person, which will be saved after this account is ready.
        userName: '',
        created: now,
        scopeNames: [],
        blocked: false,
      ),
      AnonymousUserController.methodName,
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
    auth.AuthKey authKey = auth.AuthKey(
      userId: userInfo.id!,
      key: key,
      hash: session.hashString(key),
      method: AnonymousUserController.methodName,
      scopeNames: [],
    );

    // Save the authentication key to the database in a separate session which
    // has logging disabled for security purposes.
    final savedAuthKey = await session.authKey.insert(authKey);
    if (savedAuthKey == null) {
      session.log('Failed to save $authKey', level: LogLevel.error);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.unknownError(),
      );
    }

    await session.user.insert(
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
      keyId: savedAuthKey.id!,
      method: shared.AuthType.anonymous,
      allMethods: [shared.AuthType.anonymous],
    );
  }

  /// Checks the validity of an existing session.
  static Future<shared.AppAuthResponse> checkSession(
    AppSession session, {
    // "keyId:keyValue"
    required String keyIdentifier,
  }) async {
    if (keyIdentifier.isEmpty) {
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
    if (keyIdStr.isEmpty || keyValue.isEmpty) {
      session.log('Unexpected empty keyIdentifier');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.missingCredentials(
          missingEmail: false,
          missingPassword: false,
          missingApiKey: true,
        ),
      );
    }

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

    final authKey = await session.authKey.getById(keyId);

    if (authKey == null) {
      session.log('Unknown keyId $keyId');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    final hash = session.hashString(keyValue);
    if (authKey.hash != hash) {
      session.log('Hash "$hash" is incorrect for Key Id $keyId');
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    final userInfo = await session.userInfo.getById(authKey.userId);

    if (userInfo == null) {
      session.log('AuthKey $keyId pointed to missing UserInfo. Deleting key.');
      session.authKey.delete(authKey);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(),
      );
    }

    final allKeys = await session.authKey.getAllForUserId(authKey.userId);

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
