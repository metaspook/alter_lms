part of 'settings_cubit.dart';

enum ThemeType { auto, dark, light }

class SettingsState extends Equatable {
  const SettingsState({
    this.themeType = ThemeType.auto,
    this.notificationEnabled = true,
    this.locale = const Locale('en'),
  });
  final ThemeType themeType;
  final bool notificationEnabled;
  final Locale locale;

  SettingsState copyWith({
    ThemeType? themeType,
    bool? notificationEnabled,
    Locale? locale,
  }) {
    return SettingsState(
      themeType: themeType ?? this.themeType,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [themeType, notificationEnabled, locale];
}
