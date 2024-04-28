import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/app_config/app_config.dart';

/// Platform which is used to determine whether an upgrade is required.
enum Platform {
  /// Google's OS for mobile and tablet.
  android,

  /// Apple's OS for iPhone and iPad.
  iOS,
}

/// Extension on [Platform] which exposes getters
/// to interpret the current [Platform].
extension PlatformX on Platform {
  /// Whether the current platform is [Platform.android].
  bool get isAndroid => this == Platform.android;

  /// Whether the current platform is [Platform.iOS].
  bool get isIos => this == Platform.iOS;
}

/// {@template force_upgrade}
/// Model used to encapsulate configuration information
/// regarding force upgrade.
///
/// Includes a `bool` [isUpgradeRequired] which determines if
/// the current application requires a force upgrade as well as
/// an [upgradeUrl] to link to the latest version of the application.
/// {@endtemplate}
class ForceUpgrade extends Equatable {
  /// {@macro force_upgrade}
  const ForceUpgrade({
    required this.isUpgradeRequired,
    this.upgradeUrl,
  });

  /// Returns a positive [ForceUpgrade] object, pointing to the given Url.
  factory ForceUpgrade.yes(String upgradeUrl) =>
      ForceUpgrade(isUpgradeRequired: true, upgradeUrl: upgradeUrl);

  /// Returns a negative [ForceUpgrade] object.
  factory ForceUpgrade.no() => const ForceUpgrade(isUpgradeRequired: false);

  /// Compares the current user's build versus their platform's minimum
  /// supported build and returns the appropriate [ForceUpgrade] instance.
  factory ForceUpgrade.fromAppConfig(
    AppConfig config, {
    AppDetails? appDetails,
  }) {
    // TODO(craiglabenz): Ensure this is tested.
    int minBuildNumber;
    String upgradeUrl;
    appDetails ??= GetIt.I<AppDetails>();
    if (appDetails.os.isAndroid) {
      minBuildNumber = config.minAndroidBuildNumber;
      upgradeUrl = config.androidUpgradeUrl;
    } else {
      minBuildNumber = config.minIosBuildNumber;
      upgradeUrl = config.iosUpgradeUrl;
    }
    return ForceUpgrade(
      isUpgradeRequired: appDetails.buildNumber < minBuildNumber,
      upgradeUrl: upgradeUrl,
    );
  }

  /// Whether an upgrade is required.
  final bool isUpgradeRequired;

  /// The url where users can upgrade the application.
  final String? upgradeUrl;

  @override
  List<Object?> get props => [isUpgradeRequired, upgradeUrl];
}
