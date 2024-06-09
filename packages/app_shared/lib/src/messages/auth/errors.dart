import 'package:app_shared/app_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';
part 'errors.g.dart';

/// Container for all possible errors when attempting to authorize a user.
@Freezed()
class AuthenticationError with _$AuthenticationError {
  const AuthenticationError._();

  /// Auth error indicating the attempted new user cannot be created because of
  /// a conflict on field indicated by [fieldName].
  const factory AuthenticationError.accountExists({
    required String fieldName,
    required String value,
  }) = AccountExistsError;

  /// Auth error indicating the email and password combination was unknown.
  const factory AuthenticationError.badEmailPassword() = BadEmailPasswordError;

  /// Auth error indicating the API key was unknown.
  const factory AuthenticationError.badApiKey(String reason) = BadApiKeyError;

  /// Auth error indicating the user aborted a social auth flow.
  const factory AuthenticationError.cancelledSocialAuth() =
      CancelledSocialAuthError;

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
    required bool missingApiKey,
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

  /// [Json] deserializer for [AuthenticationError].
  factory AuthenticationError.fromJson(Json json) =>
      _$AuthenticationErrorFromJson(json);

  /// Converts a given [AuthenticationError] into a display string suitable for
  /// showing the user.
  String toDisplay() => map<String>(
        badEmailPassword: (_) => 'Unknown email and password',
        cancelledSocialAuth: (_) => 'Login flow cancelled',
        accountExists: (e) =>
            'Matching account already exists for ${e.fieldName}',
        invalidPassword: (_) => 'This password is invalid',
        invalidCode: (_) => 'Failed 2-factor authentication',
        logoutError: (_) => 'Failed to logout',
        missingCredentials: (_) => 'Must supply an email and password',
        badApiKey: (_) => 'Invalid authorization credentials',
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
