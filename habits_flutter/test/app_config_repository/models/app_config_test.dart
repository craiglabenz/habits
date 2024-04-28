// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values
import 'package:flutter_test/flutter_test.dart';
import 'package:habits_flutter/app_config/models/models.dart';

void main() {
  group('AppConfig', () {
    const androidUpgradeUrl = 'mock-android-upgrade-url';
    const downForMaintenance = false;
    const iosUpgradeUrl = 'mock-ios-upgrade-url';
    const minAndroidBuildNumber = 1;
    const minIosBuildNumber = 1;

    group('AppConfig', () {
      test('is comparable by value', () {
        expect(
          AppConfig(
            androidUpgradeUrl: androidUpgradeUrl,
            downForMaintenance: downForMaintenance,
            iosUpgradeUrl: iosUpgradeUrl,
            minAndroidBuildNumber: minAndroidBuildNumber,
            minIosBuildNumber: minIosBuildNumber,
          ),
          AppConfig(
            androidUpgradeUrl: androidUpgradeUrl,
            downForMaintenance: downForMaintenance,
            iosUpgradeUrl: iosUpgradeUrl,
            minAndroidBuildNumber: minAndroidBuildNumber,
            minIosBuildNumber: minIosBuildNumber,
          ),
        );
      });
    });

    test('deserializes json', () {
      expect(
        AppConfig.fromJson(<String, dynamic>{
          'downForMaintenance': false,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        }),
        AppConfig(
          downForMaintenance: false,
          minAndroidBuildNumber: 1,
          minIosBuildNumber: 1,
          androidUpgradeUrl: 'mock-android-upgrade-url',
          iosUpgradeUrl: 'mock-ios-upgrade-url',
        ),
      );
    });

    test('deserializes DFM json', () {
      expect(
        AppConfig.fromJson(<String, dynamic>{
          'downForMaintenance': true,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        }),
        AppConfig(
          downForMaintenance: true,
          minAndroidBuildNumber: 1,
          minIosBuildNumber: 1,
          androidUpgradeUrl: 'mock-android-upgrade-url',
          iosUpgradeUrl: 'mock-ios-upgrade-url',
        ),
      );
    });
  });
}
