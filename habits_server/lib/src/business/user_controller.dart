import 'package:habits_server/src/app_session/app_session.dart';
import 'package:habits_server/src/generated/protocol.dart';
import 'package:habits_shared/habits_shared.dart' as shared;
import 'package:serverpod/protocol.dart';

/// {@template UserController}
/// Handles operations for the `User` data model.
/// {@endtemplate}
class UserController {
  /// {@template UserController.getForSession}
  /// Returns the [shared.User] record associated with the active session.
  /// {@endtemplate}
  static Future<User> getForSession(AppSession session) async {
    final userInfo = await session.authenticated;
    if (userInfo == null) {
      throw Exception(
        'Only call UserController.getForSession with authenticated sessions. '
        'The endpoint should set requireLogin to true.',
      );
    }
    final sessionUser = await session.user.getByUserInfoId(userInfo.userId);
    if (sessionUser == null) {
      throw NotFoundException(
        field: 'userInfoId',
        value: ((await session.authenticated)?.userId ?? '').toString(),
        model: Model.user,
      );
    }
    return sessionUser;
  }

  /// Applies all values from [user] to the matching database record.
  static Future<User> update(AppSession session, shared.User user) async {
    final sessionUser = await getForSession(session);
    if (sessionUser.uid.uuid != user.uid) {
      throw AccessDeniedException(message: 'Invalid user');
    }
    return session.user.update(user);
  }
}
