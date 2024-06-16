import 'package:app_shared/app_shared.dart';
import 'package:email_validator/email_validator.dart' as _ev;

/// Utility to verify the health of emails. Delegates to `pkg:email_validator`
/// and converts a false result into an [AuthenticationError].
class EmailValidator {
  /// Performs email validation.
  static AuthenticationError? validate(String email) {
    if (!_ev.EmailValidator.validate(email)) {
      return const AuthenticationError.invalidEmail();
    }
    return null;
  }
}
