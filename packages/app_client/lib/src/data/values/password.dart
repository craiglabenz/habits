import 'package:app_client/app_client.dart';
import 'package:crypt/crypt.dart';

/// Function which prepares a plain text password for safe persistance.
typedef Hasher = String Function(String, {required String salt, int? rounds});

/// {@template password}
/// Validation and hashing wrapper around a raw password string value.
///
/// Usage:
///   ```dart
///   final password = Password('raw_password');
///   final error = password.validate();
///   if (error != null) {
///     // report error
///   } else {
///     password.secureForDb();
///   }
///   ```
/// {@endtemplate}
class Password {
  /// {@macro password}
  Password(String raw, {Hasher? hasher})
      : _raw = raw,
        _hasher = hasher ?? _hash;

  final String _raw;
  final String Function(String, {required String salt, int? rounds}) _hasher;

  /// Minimum length of a valid password.
  static const minimumLength = 6;
  bool _hasValidated = false;

  /// Static value for testing.
  static Password test = Password('long-enough');

  /// Guarantees this raw password passes all checks. Call this before saving
  /// to the database.
  InvalidValueError? validate() {
    if (_raw.length < minimumLength) {
      return const InvalidValueError.passwordTooShort(minimumLength);
    }
    _hasValidated = true;
    return null;
  }

  /// Returns a hashed value suitable for storage in the database. Must call
  /// `validate` before calling this method.
  String secureForDb({required String salt, int? rounds}) {
    if (!_hasValidated) {
      throw Exception('Must validate before preparing for database');
    }
    return _hasher(_raw, salt: salt, rounds: rounds);
  }
}

String _hash(String raw, {required String salt, int? rounds}) =>
    Crypt.sha512(raw, rounds: rounds ?? 8239, salt: salt).hash;
