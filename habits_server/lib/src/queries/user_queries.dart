import 'package:habits_server/src/queries/queries.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:habits_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserQueries extends BaseQuery {
  UserQueries();

  Future<User?> insert(User user) => session.db.insertRow<User>(user);

  Future<User?> getByUid(String uid) => session.db.findFirstRow<User>(
        where: User.t.uid.equals(UuidValue.fromString(uid)),
      );

  Future<User> update(shared.User user) async {
    final dbUser = await getByUid(user.uid);
    if (dbUser == null) {
      throw NotFoundException(
        field: 'uid',
        value: user.uid,
        model: Model.user,
      );
    }
    dbUser.name = user.name;
    dbUser.country = user.country;
    dbUser.timezone = user.timezone;
    dbUser.updatedAt = DateTime.now().toUtc();
    return session.db.updateRow(dbUser);
  }

  Future<User?> getForSession() async {
    final userInfo = await session.authenticated;
    if (userInfo == null) return null;
    return session.db.findFirstRow<User>(
      where: User.t.userInfoId.equals(userInfo.userId),
    );
  }
}
