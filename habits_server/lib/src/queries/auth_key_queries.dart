import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// {@template AuthKeyQueries}
/// Query builder for the AuthKey model.
/// {@endtemplate}
class AuthKeyQueries extends BaseQuery {
  /// {@macro AuthKeyQueries}
  AuthKeyQueries(super.session);

  /// Saves a new [AuthKey] record within an ephemeral, silent session.
  Future<AuthKey?> insert(AuthKey key) async {
    final secretSession = await session.serverpod.createSession(
      enableLogging: false,
    );
    final authKey = await secretSession.db.insertRow<AuthKey>(key);
    await secretSession.close();
    return authKey;
  }

  /// Loads an [AuthKey] by its primary key.
  Future<AuthKey?> getById(int id) => session.db.findFirstRow<AuthKey>(
        where: AuthKey.t.id.equals(id),
      );

  /// Deletes the [AuthKey] from the database.
  Future<AuthKey?> delete(AuthKey key) => session.db.deleteRow<AuthKey>(key);

  /// Loads all [AuthKey]s associated with the given `UserInfo.id`.
  Future<List<AuthKey>> getAllForUserId(int userInfoId) =>
      session.db.find<AuthKey>(where: AuthKey.t.userId.equals(userInfoId));
}
