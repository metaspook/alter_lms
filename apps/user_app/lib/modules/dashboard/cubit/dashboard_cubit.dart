import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required AppNotificationRepo appNotificationRepo})
    : _appNotificationRepo = appNotificationRepo,
      super(const DashboardState()) {
    // Subscribe notifications
    _appNotificationRepo.getNotifications().then((appNotifications) {
      emit(state.copyWith(appNotifications: appNotifications));
    });
    emit(state.copyWith(status: DashboardStatus.initial));
  }

  final AppNotificationRepo _appNotificationRepo;
}
