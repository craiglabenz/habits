import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserInfoQueries extends BaseQuery {
  UserInfoQueries();

  Future<UserInfo?> getByUserIdentifier(
    String userIdentifier,
  ) =>
      session.db.findFirstRow<UserInfo>(
        where: UserInfo.t.userIdentifier.equals(userIdentifier),
      );

  Future<UserInfo?> getById(int id) => session.db.findFirstRow<UserInfo>(
        where: UserInfo.t.id.equals(id),
      );

  Future<UserInfo?> insert(UserInfo userInfo, [String? authMethod]) =>
      // Defers to core Serverpod implementation
      Users.createUser(session, userInfo, authMethod);
}
