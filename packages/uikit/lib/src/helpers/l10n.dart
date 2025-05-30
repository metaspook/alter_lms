import 'package:flutter/widgets.dart';
import 'package:uikit/src/gen/app_localizations.dart';

export 'package:uikit/src/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  Locale get locale => Localizations.localeOf(this);
}
