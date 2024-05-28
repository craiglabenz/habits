import 'package:app_client/app_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'errors.freezed.dart';

final _log = Logger('auth.AuthenticationError');

/// Container for all possible errors when attempting to authorize a user.
@Freezed()
class AuthenticationError with _$AuthenticationError {
  const AuthenticationError._();

  /// Auth error indicating the email and password combination was unknown.
  const factory AuthenticationError.badEmailPassword() = BadEmailPasswordError;

  /// Auth error indicating the user aborted a social auth flow.
  const factory AuthenticationError.cancelledSocialAuth() =
      CancelledSocialAuthError;

  /// Auth error indicating the attempted new user email is arleady known.
  const factory AuthenticationError.emailTaken() = EmailTakenError;

  /// Auth error indicating the attempted new user password fails to meet
  /// minimum criteria.
  const factory AuthenticationError.invalidPassword() = InvalidPasswordError;

  /// Auth error indicating a failed 2FA attempt.
  const factory AuthenticationError.invalidCode() = InvalidCodeError;

  /// Auth error indicating a failure to terminate a user's session.
  const factory AuthenticationError.logoutError() = LogoutError;

  /// Auth error indicating one or both of the email and password values were
  /// outright missing.
  const factory AuthenticationError.missingCredentials({
    required bool missingEmail,
    required bool missingPassword,
  }) = MissingCredentials;

  /// Auth error indicating a known user attempted to log in via the wrong
  /// method (e.g., email vs Google vs Apple).
  ///
  /// The [methods] field stores the known/valid sign in methods for a given
  /// email address after a user attempts to sign in via the wrong method.
  const factory AuthenticationError.wrongMethod(Set<AuthType> methods) =
      WrongMethod;

  /// Auth error indicating the attempt failed for an unknown reason.
  const factory AuthenticationError.unknownError() = UnknownAuthError;

  /// Constructor which converts a [FirebaseAuthException] into a local error.
  factory AuthenticationError.fromFirebaseException(FirebaseAuthException e) {
    if (e.code == 'account-exists-with-different-credential') {
      return const AuthenticationError.emailTaken();
    } else if (e.code == 'invalid-credential') {
      // Very unfortunate malformed thingy error. Probably Firebase's fault.
      _log.warning('Firebase error: Invalid-credential from $e');
      return const AuthenticationError.unknownError();
    } else if (e.code == 'operation-not-allowed') {
      _log.warning('Attempted login with inactive social auth type. Wat.');
      return const AuthenticationError.unknownError();
    } else if (e.code == 'user-disabled') {
      _log.fine('Disabled user');
      return const AuthenticationError.badEmailPassword();
    } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      // Normal failed login type stuff
      _log.finer('Failed login: ${e.code}');
      return const AuthenticationError.badEmailPassword();
    } else if (e.code == 'invalid-verification-code' ||
        e.code == 'invalid-verification-id') {
      _log.info('2FA error: ${e.code} :: from $e');
      return const AuthenticationError.invalidCode();
    }
    _log.warning(
      'Unexpected FirebaseAuthException.code value: '
      '"${e.code}" :: $e',
    );
    return const AuthenticationError.unknownError();
  }

  /// Constructor which converts a failure with the rest server into a local
  /// error.
  factory AuthenticationError.fromApiError(ApiError error) {
    if (error.statusCode == 500) {
      _log.severe('Server error: $error');
      return const AuthenticationError.unknownError();
    } else if (error.statusCode == 409) {
      _log.fine('Email taken: $error');
      return const AuthenticationError.emailTaken();
    } else if (error.statusCode == 400 || error.statusCode == 404) {
      _log.fine('Failed rest authentication: $error');
      return const AuthenticationError.badEmailPassword();
    }
    _log.severe('Unanticipated ApiError: $error');
    return const AuthenticationError.unknownError();
  }

  /// Converts a given [AuthenticationError] into a display string suitable for
  /// showing the user.
  String toDisplay() => map<String>(
        badEmailPassword: (_) => 'Unknown email and password',
        cancelledSocialAuth: (_) => 'Login flow cancelled',
        emailTaken: (_) => 'This email address is already associated with '
            'an account',
        invalidPassword: (_) => 'This password is invalid',
        invalidCode: (_) => 'Failed 2-factor authentication',
        logoutError: (_) => 'Failed to logout',
        missingCredentials: (_) => 'Must supply an email and password',
        wrongMethod: (err) {
          final methods = err.methods
              .map<String>((AuthType type) => _title(type.name))
              .join(', or ');
          return 'Account already exists. Login with $methods';
        },
        unknownError: (_) => 'Unknown login error. Try again later.',
      );
}

String _title(String value) =>
    value.substring(0, 1).toUpperCase() + value.substring(1);
