import 'package:app_shared/app_shared.dart';
import 'package:habits_server/src/utilities/utilities.dart';
import 'package:test/test.dart';

void main() {
  group('KeyValidator.validate should', () {
    test('return a missing credential if the keyIdentifier is empty', () async {
      final error = KeyValidator('').validate();
      expect(error, isNotNull);
      expect(error, isA<MissingCredentials>());
      expect((error! as MissingCredentials).missingApiKey, isTrue);
    });

    test('return a BadKeyError if the key value is empty', () {
      final error = KeyValidator('5:').validate();
      expect(error, isNotNull);
      expect(error, isA<BadApiKeyError>());
      expect(
        (error! as BadApiKeyError).message,
        'Malformed keyIdentifier - no key value',
      );
    });

    test('return a BadKeyError if the keyId is missing', () {
      final error = KeyValidator(':a').validate();
      expect(error, isNotNull);
      expect(error, isA<BadApiKeyError>());
      expect(
        (error! as BadApiKeyError).message,
        'Malformed keyIdentifier - no Id',
      );
    });

    test('return a BadKeyError if the keyId is not an integer', () {
      final error = KeyValidator('not-a-number:a').validate();
      expect(error, isNotNull);
      expect(error, isA<BadApiKeyError>());
      expect(
        (error! as BadApiKeyError).message,
        'Malformed keyIdentifier - keyId must be integer. '
        'Value was "not-a-number"',
      );
    });
  });
}
