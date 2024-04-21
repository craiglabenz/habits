// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:timezones/timezones.dart';

void main() {
  group('Timezones', () {
    test('can be instantiated', () {
      expect(Timezones(), isNotNull);
    });
  });
}
