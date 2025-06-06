import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/configs/configs.dart';
import 'package:user_app/modules/dashboard/dashboard.dart';
import 'package:utils/utils.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final route = GoRoute(
    path: '/${RouteNames.dashboard.toKebabCase()}',
    name: RouteNames.dashboard,
    builder: (context, state) => BlocProvider(
      create: (_) => DashboardCubit(
        appNotificationRepo: context.read<AppNotificationRepo>(),
      ),
      child: const DashboardPage(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
