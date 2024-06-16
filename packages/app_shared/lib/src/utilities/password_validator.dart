import 'package:app_shared/app_shared.dart';

/// {@template PasswordValidator}
/// {@endtemplate}
class PasswordValidator {
  /// {@macro PasswordValidator}
  PasswordValidator(this.password);

  /// Minimum number of total characters in a valid password. Enforced within
  /// the [validate] method.
  int minimumPasswordLength = 8;

  /// Raw ApiKey as presented from the client.
  final String password;

  /// Calling code should log this value if `validate` returns an error.
  String? log;

  /// Produces the appropriate [AuthenticationError] if the supplied key is
  /// invalid. After this method is called, and if it did not return an error,
  /// then the password was valid.
  AuthenticationError? validate() {
    if (password.length < minimumPasswordLength) {
      log = 'Password not long enough. ${password.length} characters - '
          '$minimumPasswordLength is required.';
      return const AuthenticationError.invalidPassword();
    }
    return null;
  }
}
