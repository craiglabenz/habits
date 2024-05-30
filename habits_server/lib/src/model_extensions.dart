import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:habits_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

extension SharedUser on shared.User {
  static shared.User from(User dbUser) => shared.User(
        uid: dbUser.uid.uuid,
        name: dbUser.name,
        country: dbUser.country,
        timezone: dbUser.timezone,
      );

  Future<User> update(Session session) async {
    final dbUser = await find(session);
    dbUser.name = name;
    dbUser.country = country;
    dbUser.timezone = timezone;
    dbUser.updatedAt = DateTime.now().toUtc();
    return session.db.updateRow(dbUser);
  }

  Future<User> find(Session session) async {
    final user = await session.db.findFirstRow<User>(
      where: User.t.uid.equals(UuidValue.fromString(uid)),
    );
    if (user == null) {
      throw NotFoundException(
        field: 'uid',
        value: uid,
        model: Model.user,
      );
    }
    return user;
  }
}
