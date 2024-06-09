import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_server/src/model_extensions.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Callable endpoints for the [User] model.
class UserEndpoint extends Endpoint {
  @override
  bool requireLogin = true;

  /// Returns the [shared.User] record associated with the active session.
  Future<shared.User> getForSession(Session session) async {
    final appSession = AppSession(session);
    final sessionUser = await appSession.user.getForSession();
    if (sessionUser == null) {
      throw NotFoundException(
        field: 'userInfoId',
        value: ((await session.authenticated)?.userId ?? '').toString(),
        model: Model.user,
      );
    }
    return sessionUser.toShared();
  }

  /// Saves all fields on [user], but returns an error if the given user is
  /// not associated with the active session.
  Future<shared.User> update(Session session, shared.User user) async {
    final appSession = AppSession(session);
    final sessionUser = await appSession.user.getForSession();
    if (sessionUser!.uid.uuid != user.uid) {
      throw AccessDeniedException(message: 'Invalid user');
    }
    return (await appSession.user.update(user)).toShared();
  }
}
