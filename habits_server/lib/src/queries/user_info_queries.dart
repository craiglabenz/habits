import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// {@template UserInfoQueries}
/// Query builder for the [UserInfo] model.
/// {@endtemplate}
class UserInfoQueries extends BaseQuery {
  /// {@macro UserInfoQueries}
  UserInfoQueries(super.session);

  /// Loads a [UserInfo] record by its userIdentifier value.
  Future<UserInfo?> getByUserIdentifier(String userIdentifier) =>
      session.db.findFirstRow<UserInfo>(
        where: UserInfo.t.userIdentifier.equals(userIdentifier),
      );

  /// Loads a [UserInfo] record by its primary key.
  Future<UserInfo?> getById(int pk) => session.db.findFirstRow<UserInfo>(
        where: UserInfo.t.id.equals(pk),
      );

  /// Saves a UserInfo object. This method defers to the core Serverpod
  /// implementation.
  Future<UserInfo?> insert(UserInfo userInfo, [String? authMethod]) =>
      // Defers to core Serverpod implementation
      Users.createUser(session, userInfo, authMethod);

  /// Saves the provided [email] address to the [UserInfo] account.
  Future<void> setEmail(
    int userInfoId,
    String email, {
    Transaction? transaction,
  }) async {
    final userInfo = await getById(userInfoId);
    userInfo!.email = email;
    await session.db.updateRow<UserInfo>(
      userInfo,
      columns: [UserInfo.t.email],
      transaction: transaction,
    );
  }
}
