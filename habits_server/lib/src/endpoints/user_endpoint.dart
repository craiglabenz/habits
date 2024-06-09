import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/business/business.dart';
import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_server/src/model_extensions.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:serverpod/serverpod.dart';

/// Callable endpoints for the [User] model.
class UserEndpoint extends Endpoint {
  @override
  bool requireLogin = true;

  /// {@macro UserController.getForSession}
  Future<shared.User> getForSession(Session session) async =>
      (await UserController.getForSession(AppSession(session))).toShared();

  /// Saves all fields on [user], but returns an error if the given user is
  /// not associated with the active session.
  Future<shared.User> update(Session session, shared.User user) async {
    final appSession = AppSession(session);
    return (await UserController.update(appSession, user)).toShared();
  }
}
