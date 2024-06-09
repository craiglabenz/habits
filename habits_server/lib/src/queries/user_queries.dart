import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_server/src/queries/queries.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:serverpod/serverpod.dart';

/// {@template UserQueries}
/// Query builder for the [User] model.
/// {@endtemplate}
class UserQueries extends BaseQuery {
  /// {@macro UserQueries}
  UserQueries(super.session);

  /// Saves a [User] record to the database.
  Future<User?> insert(User user) => session.db.insertRow<User>(user);

  /// Loads a [User] record by its Uid.
  Future<User?> getByUid(String uid) => session.db.findFirstRow<User>(
        where: User.t.uid.equals(UuidValue.fromString(uid)),
      );

  /// Loads a [User] record by its `UserInfo.id`.
  Future<User?> getByUserInfoId(int userInfoId) =>
      session.db.findFirstRow<User>(
        where: User.t.userInfoId.equals(userInfoId),
      );

  /// Saves new values to an existing [User] record.
  Future<User> update(shared.User user) async {
    final dbUser = await getByUid(user.uid);
    if (dbUser == null) {
      throw NotFoundException(
        field: 'uid',
        value: user.uid,
        model: Model.user,
      );
    }
    dbUser
      ..name = user.name
      ..country = user.country
      ..timezone = user.timezone
      ..updatedAt = DateTime.now().toUtc();
    return session.db.updateRow(dbUser);
  }
}
