import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Fetches localizations from a [BuildContext].
extension AppLocalizationsX on BuildContext {
  /// Inherited-widget getter for [BuildContext]s.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
