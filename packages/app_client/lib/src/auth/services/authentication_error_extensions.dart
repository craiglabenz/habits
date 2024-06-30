import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _log = AppLogger('AuthenticationError');

/// Adds a builder from Firebase errors.
extension AuthenticationErrorFromFirebase on AuthenticationError {
  /// Constructor which converts a [FirebaseAuthException] into a local error.
  static AuthenticationError fromFirebaseException(FirebaseAuthException e) {
    if (e.code.contains('account-exists-with-different-credential')) {
      return AuthenticationError.accountExists(
        fieldName: 'email',
        value: e.email ?? '',
      );
    } else if (e.code.contains('invalid-credential')) {
      // Very unfortunate malformed thingy error. Probably Firebase's fault.
      _log.warning('Firebase error: Invalid-credential from $e');
      return const AuthenticationError.unknownError();
    } else if (e.code.contains('operation-not-allowed')) {
      _log.warning('Attempted login with inactive social auth type. Wat.');
      return const AuthenticationError.unknownError();
    } else if (e.code.contains('user-disabled')) {
      _log.fine('Disabled user');
      return const AuthenticationError.badEmailPassword();
    } else if (e.code.contains('user-not-found') ||
        e.code.contains('wrong-password')) {
      // Normal failed login type stuff
      _log.finer('Failed login: ${e.code}');
      return const AuthenticationError.badEmailPassword();
    } else if (e.code.contains('invalid-verification-code') ||
        e.code.contains('invalid-verification-id')) {
      _log.info('2FA error: ${e.code} :: from $e');
      return const AuthenticationError.invalidCode();
    }
    _log.warning(
      'Unexpected FirebaseAuthException.code value: '
      '"${e.code}" :: $e',
    );
    return const AuthenticationError.unknownError();
  }
}

/// Adds a builder from Rest API errors.
extension AuthenticationErrorFromApiError on AuthenticationError {
  /// Constructor which converts a failure with the rest server into a local
  /// error.
  static AuthenticationError fromApiError(ApiError error) {
    if (error.statusCode == 500) {
      _log.severe('Server error: $error');
      return const AuthenticationError.unknownError();
    } else if (error.statusCode == 409) {
      _log.fine('Email taken: $error');
      return const AuthenticationError.accountExists(
        fieldName: 'email',
        value: '',
      );
    } else if (error.statusCode == 400 || error.statusCode == 404) {
      _log.fine('Failed rest authentication: $error');
      return const AuthenticationError.badEmailPassword();
    }
    _log.severe('Unanticipated ApiError: $error');
    return const AuthenticationError.unknownError();
  }
}
