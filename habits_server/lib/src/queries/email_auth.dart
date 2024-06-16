import 'package:habits_server/src/queries/queries.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// {@template EmailAuthQueries}
/// Query builder for the [EmailAuth] model.
/// {@endtemplate}
class EmailAuthQueries extends BaseQuery {
  /// {@macro EmailAuthQueries}
  EmailAuthQueries(super.session);

  /// Loads an [EmailAuth] record for the given [userInfoId], if one exists.
  Future<EmailAuth?> getByUserId(int userInfoId) =>
      session.db.findFirstRow<EmailAuth>(
        where: EmailAuth.t.userId.equals(userInfoId),
      );

  /// Saves an [EmailAuth] record to the database. Provided record should not
  /// yet have an Id.
  Future<EmailAuth> insert(EmailAuth emailAuth) async {
    if (emailAuth.id != null) {
      throw Exception(
        'Attempted to save $emailAuth which already has Id ${emailAuth.id}',
      );
    }
    return session.db.insertRow<EmailAuth>(emailAuth);
  }

  /// Hashes a password for safe storage.
  Future<String> generatePasswordHash(String password) =>
      Emails.generatePasswordHash(password);
}
