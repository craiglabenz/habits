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

  /// Deletes a saved [EmailAuth] record from the database.
  Future<void> delete(EmailAuth emailAuth) {
    if (emailAuth.id == null) {
      throw Exception('Attempting to delete unsaved $emailAuth');
    }
    return session.db.deleteRow(emailAuth);
  }

  /// Loads an [EmailAuth] record for the email and (hashed) password
  /// combination, if one exists.
  Future<EmailAuth?> getForLogin(String email, String hashedPassword) async =>
      session.db.findFirstRow<EmailAuth>(
        where: EmailAuth.t.email.equals(email.toLowerCase().trim()) &
            EmailAuth.t.hash.equals(hashedPassword),
      );

  /// Hashes a password for safe storage.
  Future<String> generatePasswordHash(String password) =>
      Emails.generatePasswordHash(password);

  /// Logs the failed login attempt.
  Future<void> insertFailedSignIn(String email, String ipAddress) =>
      session.db.insertRow<EmailFailedSignIn>(
        EmailFailedSignIn(
          email: email,
          time: DateTime.now(),
          ipAddress: ipAddress,
        ),
      );
}
