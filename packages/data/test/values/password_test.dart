import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  group('Password should', () {
    test('invalidate when too short', () {
      expect(
        Password('asdf').validate(),
        equals(const InvalidValueError.passwordTooShort(6)),
      );
    });
    test('hash correctly', () {
      final pw = Password(
        '123456',
        hasher: (
          String raw, {
          required String salt,
          int? rounds,
        }) =>
            '${raw.toLowerCase()}::$salt::$rounds',
      )..validate();
      expect(
        pw.secureForDb(salt: 'abc', rounds: 5),
        '123456::abc::5',
      );
    });
    test('use default hasher', () {
      expect(
        (Password('123456')..validate()).secureForDb(salt: 'abc'),
        'TwRk/hjQVQsegnov92XknXP1oGrBF5/IEzqrVS5OoU23LKNmdRy8.O1FuuVWuLhcokj17mjfhZ5SSwsZW0n/N0',
      );
    });
  });
}
