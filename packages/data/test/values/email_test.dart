import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  group('Email should', () {
    test('report invalid', () {
      expect(Email('asdf').validate(), equals(const InvalidEmail()));
      expect(Email('asdf@asdf').validate(), equals(const InvalidEmail()));
      expect(Email('asdf@asdf.').validate(), equals(const InvalidEmail()));
      expect(Email('asdf.com').validate(), equals(const InvalidEmail()));
      expect(Email('asdf@.com').validate(), equals(const InvalidEmail()));
      expect(Email('.asdf@com').validate(), equals(const InvalidEmail()));
      expect(Email('asf@asf@asf.com').validate(), equals(const InvalidEmail()));
    });
    test('allow valid', () {
      expect(Email('asdf@asdf.com').validate(), isNull);
      expect(Email('asdf@asdf.net').validate(), isNull);
      expect(Email('asdf.asdf@asdf.com').validate(), isNull);
      expect(Email('asdf+asdf@asdf.com').validate(), isNull);
    });
  });
}
