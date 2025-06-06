
part of 'dashboard_cubit.dart';

enum DashboardStatus { initial, loading, success, failure }

final class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.loading,
    this.statusAlert = StatusAlert.empty,
    this.appNotifications = const [],
  });

  final DashboardStatus status;
  final StatusAlert statusAlert;
  final List<AppNotification> appNotifications;

  DashboardState copyWith({
    DashboardStatus? status,
    StatusAlert? statusAlert,
    List<AppNotification>? appNotifications,
  }) {
    return DashboardState(
      status: status ?? this.status,
      statusAlert: statusAlert ?? this.statusAlert,
      appNotifications: appNotifications ?? this.appNotifications,
    );
  }

  @override
  List<Object> get props => [status, statusAlert, appNotifications];
}


