import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:platform/platform.dart' as platform;

class MockPlatform extends Mock implements platform.Platform {}

void main() {
  group('currentPlatform', () {
    test('returns iOS when isIOS is true', () {
      final platform = MockPlatform();
      when(() => platform.isAndroid).thenReturn(false);
      when(() => platform.isIOS).thenReturn(true);
      expect(getCurrentPlatform(platform), Platform.iOS);
    });

    test('returns Android when isAndroid is true', () {
      final platform = MockPlatform();
      when(() => platform.isAndroid).thenReturn(true);
      when(() => platform.isIOS).thenReturn(false);
      expect(getCurrentPlatform(platform), Platform.android);
    });

    test('throws unsupported when neither iOS or Android', () {
      final platform = MockPlatform();
      when(() => platform.isAndroid).thenReturn(false);
      when(() => platform.isIOS).thenReturn(false);
      when(() => platform.isMacOS).thenReturn(false);
      expect(
        () => getCurrentPlatform(platform),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('platform is optional', () {
      expect(getCurrentPlatform, returnsNormally);
    });
  });

  group('buildNumber', () {
    test('is not null', () {
      expect(getBuildNumber(), isNotNull);
    });

    test('returns 0 when packageVersion is empty', () {
      expect(getBuildNumber(''), 0);
    });

    test('returns 0 when packageVersion is missing a build number', () {
      expect(getBuildNumber('1.0.0'), 0);
    });

    test('returns 0 when packageVersion has a malformed build number', () {
      expect(getBuildNumber('1.0.0+'), 0);
    });

    test('returns 42 when build number is 42', () {
      expect(getBuildNumber('1.0.0+42'), 42);
    });
  });
}
