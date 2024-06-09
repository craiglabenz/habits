import 'package:app_shared/app_shared.dart' as shared;
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

/// Performs operations on accounts authenticating with "anonymous"
/// credentials.
class AnonymousUserController {
  /// Marker of which authentication style completed these various operations.
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
        // Unused field. See `user.name` instead.
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
      return const shared.AppAuthFailure(
        reason: shared.AuthenticationError.unknownError(),
      );
    }

    // Create the resource that the client will use to access this session.
    final authKey = auth.AuthKey(
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
      return const shared.AppAuthFailure(
        reason: shared.AuthenticationError.unknownError(),
      );
    }

    await session.user.insert(
      User(
        id: userInfo.id,
        userInfoId: userInfo.id!,
        uid: UuidValue.fromString(const Uuid().v4()),
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
    final validator = session.getKeyValidator(keyIdentifier);
    final error = validator.validate();

    if (error != null) {
      session.log(validator.log!);
      return shared.AppAuthFailure(reason: error);
    }

    final authKey = await session.authKey.getById(validator.keyId);
    if (authKey == null) {
      final log = 'Unknown keyId ${validator.keyId}';
      session.log(log);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(log),
      );
    }

    final hash = session.hashString(validator.key);
    if (authKey.hash != hash) {
      final log = 'Hash "$hash" is incorrect for Key Id ${validator.keyId}';
      session.log(log);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(log),
      );
    }

    final userInfo = await session.userInfo.getById(authKey.userId);

    if (userInfo == null) {
      final log = 'AuthKey ${validator.keyId} pointed to missing UserInfo';
      session.log('$log. Deleting key.');
      await session.authKey.delete(authKey);
      return shared.AppAuthFailure(
        reason: shared.AuthenticationError.badApiKey(log),
      );
    }

    final allKeys = await session.authKey.getAllForUserId(authKey.userId);

    return shared.AppAuthSuccess(
      userInfoData: userInfo.toJson(),
      key: validator.key,
      keyId: authKey.id!,
      method: shared.AuthType.fromJson(authKey.method),
      allMethods: allKeys
          .map<shared.AuthType>((key) => shared.AuthType.fromJson(key.method))
          .toList(),
    );
  }
}
