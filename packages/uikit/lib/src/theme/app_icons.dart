import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

abstract final class AppIcons {
  // Status
  static const IconData error = Icons.not_interested_rounded;
  static const IconData warning = Icons.error_outline_rounded;
  static const IconData success = Icons.check_circle_outline_rounded;
  static const IconData info = Icons.info_outlined;
  // Other
  static const IconData notFound = Icons.error_rounded;
  // Status Records
  static const ({MaterialColor color, IconData icon}) errorRecord = (
    color: AppColors.error,
    icon: error,
  );
  static const ({MaterialAccentColor color, IconData icon}) warningRecord = (
    color: AppColors.warning,
    icon: warning,
  );
  static const ({MaterialColor color, IconData icon}) successRecord = (
    color: AppColors.success,
    icon: success,
  );
  static const ({Color color, IconData icon}) infoRecord = (
    color: AppColors.info,
    icon: info,
  );
  // Other Records
  static const ({MaterialAccentColor color, IconData icon}) notFoundRecord = (
    color: AppColors.warning,
    icon: notFound,
  );
}
