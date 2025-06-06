import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

enum AppNotificationType {
  info,
  event;

  bool get isInfo => this == AppNotificationType.info;
  bool get isEvent => this == AppNotificationType.event;
}

final class AppNotification extends Equatable {
  const AppNotification({
    required this.id,
    required this.message,
    required this.type,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      'id': final String id,
      'message': final String message,
      'type': final String type,
    } =>
      AppNotification(
        id: id,
        message: message,
        type: AppNotificationType.values.byName(type),
      ),
    _ => throw FormatException('Invalid json: $json'),
  };

  final String id;
  final String message;
  final AppNotificationType type;

  static const empty = AppNotification(
    id: '',
    type: AppNotificationType.info,
    message: '',
  );
  bool get isEmpty => this == StatusAlert.empty;
  bool get isNotEmpty => this != StatusAlert.empty;

  AppNotification copyWith({
    String? id,
    String? message,
    AppNotificationType? type,
  }) {
    return AppNotification(
      id: id ?? this.id,
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'message': message, 'type': type};
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, message, type];
}

extension AppNotificationsExt on Iterable<AppNotification> {
  List<Json> toJsons() => map((n) => n.toJson()).toList();
}

extension AppNotificationJsonsExt on Iterable<Json> {
  List<AppNotification> toNotifications() =>
      map(AppNotification.fromJson).toList();
}
