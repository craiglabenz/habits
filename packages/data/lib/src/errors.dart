import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';
part 'errors.g.dart';

/// Validation error for a value type.
@Freezed()
class InvalidValueError with _$InvalidValueError {
  const InvalidValueError._();

  /// Impossible ApiKey error.
  const factory InvalidValueError.invalidApiKey() = InvalidApiKey;

  /// Invalid email error.
  const factory InvalidValueError.invalidEmail() = InvalidEmail;

  /// Too short password error.
  const factory InvalidValueError.passwordTooShort(int minimumLength) =
      PasswordTooShort;

  /// Deserializer for [InvalidValueError] instances.
  factory InvalidValueError.fromJson(Map<String, dynamic> json) =>
      _$InvalidValueErrorFromJson(json);
}
