import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginUrl extends ApiUrl {
  const LoginUrl() : super(path: 'users/login/');
}

class DynamicUrl extends ApiUrl {
  DynamicUrl(String token)
      : super(
          path: 'users/{{token}}/',
          context: <String, Object?>{'token': token},
        );
}

void main() {
  group('Value rendered correctly for', () {
    test('LoginUrl', () {
      expect(
        const LoginUrl().value,
        'api/v1/users/login/',
      );
    });
    test('DynamicUrl', () {
      expect(
        DynamicUrl('asdf').value,
        'api/v1/users/asdf/',
      );
    });
  });
}
