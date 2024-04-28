import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiKey should', () {
    test('report invalid', () {
      expect(ApiKey('asdf').validate(), equals(const InvalidApiKey()));
    });
    test('allow valid', () {
      expect(ApiKey('12345678901234567890123456789012').validate(), isNull);
      expect(ApiKey.test.validate(), isNull);
      expect(ApiKey.generate().validate(), isNull);
    });
  });
}
