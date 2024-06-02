import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AuthKeyQueries extends BaseQuery {
  AuthKeyQueries(super.session);

  Future<AuthKey?> insert(AuthKey key) async {
    final secretSession = await session.serverpod.createSession(
      enableLogging: false,
    );
    final authKey = await secretSession.db.insertRow<AuthKey>(key);
    await secretSession.close();
    return authKey;
  }

  Future<AuthKey?> getById(int id) => session.db.findFirstRow<AuthKey>(
        where: AuthKey.t.id.equals(id),
      );

  Future<AuthKey?> delete(AuthKey key) => session.db.deleteRow<AuthKey>(key);

  Future<List<AuthKey>> getAllForUserId(int userId) => session.db.find<AuthKey>(
        where: AuthKey.t.userId.equals(userId),
      );
}
