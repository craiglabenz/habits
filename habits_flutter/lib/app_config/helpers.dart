import 'package:flutter/widgets.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/version.dart';
import 'package:platform/platform.dart' as platform;

/// Returns the current runtime platform. Because the only actually supported
/// build targets will be [Platform.android] and [Platform.iOS], the macOS
/// local development build target is spoofed to be iOS.
Platform getCurrentPlatform([
  platform.Platform localPlatform = const platform.LocalPlatform(),
]) {
  if (localPlatform.isAndroid) {
    return Platform.android;
  }
  if (localPlatform.isIOS) {
    return Platform.iOS;
  }
  if (localPlatform.isMacOS) {
    return Platform.iOS;
  }
  throw UnsupportedError('unsupported platform exception');
}

/// Collects the string name of the current operating system for network request
/// headers.
String currentPlatformVersion() =>
    const platform.LocalPlatform().operatingSystemVersion;

/// Collects the string of the user's current language for network request
/// headers.
String getLanguageCode(BuildContext context) =>
    Localizations.localeOf(context).languageCode;

/// Colelcts the current build number for network request headers.
int getBuildNumber([String version = packageVersion]) {
  final versionSegments = version.split('+');
  if (versionSegments.isEmpty) return 0;
  return int.tryParse(versionSegments.last) ?? 0;
}

/// Colelcts the current build version for network request headers.
String getBuildVersion([String version = packageVersion]) {
  final versionSegments = version.split('+');
  if (versionSegments.isEmpty) return '1.0.0';
  return versionSegments.first;
}
