import 'dart:math';

import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/app_session/app_session.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Performs high-level operations on [AuthKey] objects.
class AuthKeyController {
  /// Instantiates a new [AuthKey] object, but does not save it to the database.
  static AuthKey create(
    AppSession session, {
    required int userId,
    required String methodName,
    String? key,
  }) {
    key ??= Random().nextString();
    return AuthKey(
      userId: userId,
      key: key,
      hash: session.hashString(key),
      method: methodName,
      scopeNames: [],
    );
  }

  /// Loads all [AuthType]s associated with the given `UserInfo.id`.
  static Future<Set<AuthType>> getAuthTypesForUserId(
    AppSession appSession,
    int userInfoId,
  ) async {
    final authTypes = <AuthType>{};
    final query = appSession.authKey.getAllForUserId(userInfoId);
    for (final authKey in await query) {
      authTypes.add(AuthType.fromJson(authKey.method));
    }
    return authTypes;
  }
}
