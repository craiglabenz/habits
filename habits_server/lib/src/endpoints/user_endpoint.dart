import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:serverpod/serverpod.dart';
import '../model_extensions.dart';

class UserEndpoint extends Endpoint {
  @override
  bool requireLogin = true;

  Future<shared.User> getForSession(Session session) async {
    final authId = (await session.authenticated)!.userId;
    final user = await session.db.findFirstRow<User>(
      where: User.t.id.equals(authId),
    );
    if (user == null) {
      throw NotFoundException(
        field: 'id',
        value: authId.toString(),
        model: Model.user,
      );
    }
    return SharedUser.from(user);
  }

  Future<shared.User> update(Session session, shared.User user) async =>
      SharedUser.from(await user.update(session));
}
