// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app_config/app_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const platformAndroid = Platform.android;
  // setUpTestingDI();

  AppDetails buildAppDetails({
    String? apiBaseUrl,
    String? appVersion,
    Platform? os,
    String? osVersion,
    int? buildNumber,
  }) =>
      AppDetails(
        apiBaseUrl: apiBaseUrl ?? 'base-url',
        appVersion: appVersion ?? '1.0.0',
        os: os ?? Platform.iOS,
        osVersion: osVersion ?? '1',
        environment: Environment.test,
        buildNumber: buildNumber ?? 1,
      );

  group('AppConfigRepository', () {
    test('throws AssertionError when build number is less than 1', () {
      expect(
        () => AppDetails(
          apiBaseUrl: '',
          appVersion: '1.0.0',
          buildNumber: 0,
          environment: Environment.test,
          os: platformAndroid,
          osVersion: '11',
        ),
        throwsAssertionError,
      );
    });

    test('does not require an injected Firestore instance', () {
      expect(
        () {
          GetIt.I.get<BaseAppConfigRepository>();
        },
        isNot(throwsException),
      );
    });

    group('streams', () {
      // test('yields false when stream throws error', () async {
      //   final document = MockDocumentReference<Map<String, dynamic>>();
      //   when(() => firestore.doc('global/app_config')).thenReturn(document);
      //   when(document.snapshots).thenAnswer((_) =>
      //       Stream<DocumentSnapshot<Map<String, dynamic>>>.error('oops'));
      //   await expectLater(
      //     appConfigRepository.isForceUpgradeRequired(),
      //     emitsInOrder(
      //       const <ForceUpgrade>[ForceUpgrade(isUpgradeRequired: false)],
      //     ),
      //   );
      // });

      test('yields false when AppConfig is incomplete / empty', () async {
        final service = FakeAppConfigService();
        final repo = AppConfigRepository(
          service: service,
          details: buildAppDetails(buildNumber: 2, os: Platform.android),
        );
        final appConfig = <String, dynamic>{};

        final stream = repo.isForceUpgradeRequired;
        final fut = expectLater(
          stream,
          emitsInOrder(
            const <ForceUpgrade>[
              ForceUpgrade(
                isUpgradeRequired: false,
                upgradeUrl: '',
                // upgradeUrl: 'mock-android-upgrade-url',
              ),
            ],
          ),
        );
        final fut2 = expectLater(
          repo.isDownForMaintenance,
          emitsInOrder(<bool>[false]),
        );
        service.add(appConfig);
        await Future.wait([fut, fut2]);
      });

      test('yields false when models hit directly', () async {
        final appConfig = AppConfig.fromJson(<String, dynamic>{
          'downForMaintenance': false,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        });
        final forceUpgrade = ForceUpgrade.fromAppConfig(
          appConfig,
          appDetails: buildAppDetails(buildNumber: 2, os: Platform.android),
        );
        expect(
          forceUpgrade,
          const ForceUpgrade(
            isUpgradeRequired: false,
            upgradeUrl: 'mock-android-upgrade-url',
          ),
        );
      });

      test('yields false when build number is greater than min', () async {
        final service = FakeAppConfigService();
        final repo = AppConfigRepository(
          service: service,
          details: buildAppDetails(buildNumber: 2, os: Platform.android),
        );
        final appConfig = <String, dynamic>{
          'downForMaintenance': false,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        };

        final stream = repo.isForceUpgradeRequired;
        final fut = expectLater(
          stream,
          emitsInOrder(
            const <ForceUpgrade>[
              ForceUpgrade(
                isUpgradeRequired: false,
                upgradeUrl: 'mock-android-upgrade-url',
              ),
            ],
          ),
        );
        service.add(appConfig);
        await fut;
      });

      test('yields false when build number is equal to min', () async {
        final service = FakeAppConfigService();
        final repo = AppConfigRepository(
          service: service,
          details: buildAppDetails(os: Platform.android),
        );
        final appConfig = <String, dynamic>{
          'downForMaintenance': false,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        };

        final fut = expectLater(
          repo.isForceUpgradeRequired,
          emitsInOrder(
            const <ForceUpgrade>[
              ForceUpgrade(
                isUpgradeRequired: false,
                upgradeUrl: 'mock-android-upgrade-url',
              ),
            ],
          ),
        );
        final fut2 = expectLater(
          repo.isDownForMaintenance,
          emitsInOrder(<bool>[false]),
        );
        service.add(appConfig);
        await Future.wait([fut, fut2]);
      });

      test('yields true when build number is less than min (android)',
          () async {
        final service = FakeAppConfigService();
        final repo = AppConfigRepository(
          service: service,
          details: buildAppDetails(os: Platform.android),
        );
        final appConfig = <String, dynamic>{
          'downForMaintenance': true,
          'minAndroidBuildNumber': 2,
          'minIosBuildNumber': 1,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        };

        final fut = expectLater(
          repo.isForceUpgradeRequired,
          emitsInOrder(
            const <ForceUpgrade>[
              ForceUpgrade(
                isUpgradeRequired: true,
                upgradeUrl: 'mock-android-upgrade-url',
              ),
            ],
          ),
        );
        final fut2 = expectLater(
          repo.isDownForMaintenance,
          emitsInOrder(<bool>[true]),
        );
        service.add(appConfig);
        await Future.wait([fut, fut2]);
      });

      test('yields true when build number is less than min (iOS)', () async {
        final service = FakeAppConfigService();
        final repo = AppConfigRepository(
          service: service,
          details: buildAppDetails(os: Platform.iOS),
        );
        final appConfig = <String, dynamic>{
          'downForMaintenance': false,
          'minAndroidBuildNumber': 1,
          'minIosBuildNumber': 2,
          'androidUpgradeUrl': 'mock-android-upgrade-url',
          'iosUpgradeUrl': 'mock-ios-upgrade-url',
        };

        final fut = expectLater(
          repo.isForceUpgradeRequired,
          emitsInOrder(
            const <ForceUpgrade>[
              ForceUpgrade(
                isUpgradeRequired: true,
                upgradeUrl: 'mock-ios-upgrade-url',
              ),
            ],
          ),
        );
        service.add(appConfig);
        await fut;
      });
    });
  });
}
