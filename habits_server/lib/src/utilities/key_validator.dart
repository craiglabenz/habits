import 'package:app_shared/app_shared.dart';

/// {@template KeyValidator}
/// {@endtemplate}
final class KeyValidator {
  /// {@macro KeyValidator}
  KeyValidator(this.keyIdentifier);

  /// Raw ApiKey as presented from the client.
  final String keyIdentifier;

  /// Calling code should log this value if `validate` returns an error.
  String? log;

  int? _keyId;

  /// Parsed `AuthKey` primary key, extracted from the [keyIdentifier].
  int get keyId {
    if (_keyId == null) {
      throw Exception('You must call `validate` before accessing keyId');
    }
    return _keyId!;
  }

  String? _key;

  /// Parsed API key, extracted from the [keyIdentifier].
  String get key {
    if (_key == null) {
      throw Exception('You must call `validate` before accessing key');
    }
    return _key!;
  }

  /// Produces the appropriate [AuthenticationError] if the supplied key is
  /// invalid. After this method is called, and if it did not return an error,
  /// then the [key] and [keyId] properties will be ready for access.
  AuthenticationError? validate() {
    if (keyIdentifier.isEmpty) {
      log = 'Unexpectedly empty keyIdentifier';
      return missingCredentials;
    }
    if (!keyIdentifier.contains(':')) {
      log = 'Malformed keyIdentifier - no delimiter';
      return AuthenticationError.badApiKey(log!);
    }
    final [String keyIdStr, String keyValue] = keyIdentifier.split(':');
    if (keyIdStr.isEmpty) {
      log = 'Malformed keyIdentifier - no Id';
      return AuthenticationError.badApiKey(log!);
    }
    if (keyValue.isEmpty) {
      log = 'Malformed keyIdentifier - no key value';
      return AuthenticationError.badApiKey(log!);
    }
    _key = keyValue;

    final int? parsedKeyId = int.tryParse(keyIdStr);
    if (parsedKeyId == null) {
      log = 'Malformed keyIdentifier - keyId must be integer. Value was '
          '"$keyIdStr"';
      return missingCredentials;
    }
    _keyId = parsedKeyId;
    return null;
  }

  /// Error indicating the KeyIdentifier *never took place*.
  static const missingCredentials = AuthenticationError.missingCredentials(
    missingEmail: false,
    missingPassword: false,
    missingApiKey: true,
  );
}
