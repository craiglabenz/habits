import 'package:data/data.dart';
import 'package:uuid/uuid.dart';

/// {@template ApiKey}
/// Authorization credentials to communicate with the Rest API.
/// {@endtemplate}
class ApiKey {
  /// {@macro ApiKey}
  ApiKey(this._raw);

  /// Builder which generates a new Uuid().v4() as the raw ApiKey value.
  factory ApiKey.generate() =>
      ApiKey(const Uuid().v4().replaceAll('-', ''))..validate();

  final String _raw;
  bool _hasValidated = false;

  /// Ensures this instance has a valid value.
  InvalidValueError? validate() {
    if (_raw.length != 32) {
      return const InvalidApiKey();
    }
    _hasValidated = true;
    return null;
  }

  //                                   10        20          32
  /// Test-suitable constant.
  static ApiKey test = ApiKey('12345678901234567890123456789012');

  /// Raw value for this ApiKey.
  String get value {
    if (!_hasValidated) {
      throw Exception('Must validate before accessing raw data');
    }
    return _raw;
  }
}
