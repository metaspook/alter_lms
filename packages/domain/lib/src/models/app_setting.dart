import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

enum AppSettingType {
  local,
  remote;

  bool get isLocal => this == AppSettingType.local;
  bool get isRemote => this == AppSettingType.remote;
}

final class AppSetting extends Equatable {
  const AppSetting({
    required this.id,
    required this.key,
    required this.type,
    required this.value,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      'id': final String id,
      'message': final String message,
      'type': final String type,
      'value': final Object? value,
    } =>
      AppSetting(
        id: id,
        key: message,
        type: AppSettingType.values.byName(type),
        value: value,
      ),
    _ => throw FormatException('Invalid json: $json'),
  };

  final String id;
  final String key;
  final AppSettingType type;
  final Object? value;

  static const empty = AppSetting(
    id: '',
    type: AppSettingType.local,
    key: '',
    value: null,
  );
  bool get isEmpty => this == StatusAlert.empty;
  bool get isNotEmpty => this != StatusAlert.empty;

  AppSetting copyWith({
    String? id,
    String? message,
    AppSettingType? type,
    Object? value,
  }) {
    return AppSetting(
      id: id ?? this.id,
      key: message ?? key,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'message': key, 'type': type, 'value': value};
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, key, type, value];
}

extension AppSettingsExt on Iterable<AppSetting> {
  List<Json> toJsons() => map((n) => n.toJson()).toList();
}

extension AppSettingJsonsExt on Iterable<Json> {
  List<AppSetting> toAppSettings() => map(AppSetting.fromJson).toList();
}
