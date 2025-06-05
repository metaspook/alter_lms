import 'dart:developer' as dev;

import 'package:uikit/src/gen/app_localizations.dart';

extension AppLocalizationsExt on AppLocalizations {
  /// Resolves l10n string by content key.
  String resolve(String key, {String? placeholder}) {
    final value = switch (key) {
      // Menu related
      'liveClass' => liveClass,
      'shop' => shop,
      'courses' => courses,
      'students' => students,
      'groups' => groups,
      'signOut' => signOut,
      _ => '',
    };
    if (value.isEmpty) {
      dev.log('Missing translation!', name: runtimeType.toString());
      return placeholder ?? key;
    }
    return value;
  }
}
