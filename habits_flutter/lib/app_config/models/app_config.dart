import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

/// {@template AppConfig}
/// Application Configuration which contains the relevant
/// information needed to determine whether or not the application is
/// down for maintenance or requires a force upgrade.
/// {@endtemplate}
@Freezed()
class AppConfig with _$AppConfig {
  /// {@macro AppConfig}
  const factory AppConfig({
    /// The upgrade URL for Android.
    @Default('') String androidUpgradeUrl,

    /// Whether the app is down for maintenance.
    @Default(false) bool downForMaintenance,

    /// The upgrade URL for iOS.
    @Default('') String iosUpgradeUrl,

    /// The minimum supported build number for Android.
    @Default(1) int minAndroidBuildNumber,

    /// The minimum supported build number for iOS.
    @Default(1) int minIosBuildNumber,
  }) = _AppConfig;

  /// Converts a [Map<String, Object?>] into an [AppConfig] instance.
  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
