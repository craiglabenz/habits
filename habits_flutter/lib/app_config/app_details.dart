import 'package:habits_flutter/app_config/app_config.dart';

/// Indicator for the nature of the runtime - for real, for development, or
/// tests.
enum Environment {
  /// Indicates the app is in the hands of real end users.
  prod,

  /// Indicates the app is in the hands of beta testers.
  qa,

  /// Indicates the app is being actively being developed.
  dev,

  /// Indicates we are running in a `flutter test` simulation.
  test
}

/// Container for all the answers to that famous question from Lost:
/// "Where are we?"
class AppDetails {
  /// Const constructor.
  const AppDetails({
    required this.apiBaseUrl,
    required this.appVersion,
    required this.environment,
    required this.buildNumber,
    required this.os,
    required this.osVersion,
  }) : assert(buildNumber > 0, 'buildNumber must be a positive integer');

  /// [AppDetails] constructor that uses real values.
  factory AppDetails.live({
    required String apiBaseUrl,
    required Environment env,
  }) =>
      AppDetails(
        apiBaseUrl: apiBaseUrl,
        appVersion: getBuildVersion(),
        buildNumber: getBuildNumber(),
        environment: env,
        os: getCurrentPlatform(),
        osVersion: currentPlatformVersion(),
      );

  /// Constructor which uses faked details for testing.
  factory AppDetails.fake() => const AppDetails(
        apiBaseUrl: 'https://fake.com/',
        appVersion: 'fake',
        environment: Environment.test,
        buildNumber: 1,
        os: Platform.iOS,
        osVersion: '1',
      );

  /// Scheme, host, and TLD of the main Django REST API
  final String apiBaseUrl;

  /// App version string pulled from pubspec.yaml
  final String appVersion;

  /// Dev/Prod/etc
  final Environment environment;

  /// App build number pulled from pubspec.yaml.
  final int buildNumber;

  /// Runtime OS
  final Platform os;

  /// Version of the OS.
  final String osVersion;

  /// Returns base headers for network requests.
  Map<String, String> getDefaultHeaders() => <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'App-Name': 'Habits',
        'App-Version': appVersion,
        'App-Build': buildNumber.toString(),

        /// iOS/Android
        'App-OS': os.toString(),

        /// OS build number
        'App-OS-Version': osVersion,

        /// Dev/Prod/etc
        'App-Environment': environment.toString(),
      };
}
