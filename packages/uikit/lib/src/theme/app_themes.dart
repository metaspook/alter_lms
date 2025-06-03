import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

/// This class contains all the theme configurations used in the application.
abstract final class AppThemes {
  static ThemeData light(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: context.theme.colorScheme.inversePrimary,
    ),
    useMaterial3: true,
  );
  static ThemeData dark(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: context.theme.colorScheme.inversePrimary,
    ),
    useMaterial3: true,
  );
  //- paddings
  static const titlePadding = EdgeInsets.only(
    left: appSpacing * 2.125,
    right: appSpacing * 2.125,
    top: appSpacing * 1.875,
  );
  static const contentPadding = EdgeInsets.only(
    left: appSpacing * 2.125,
    right: appSpacing * 2.125,
    top: appSpacing * .875,
  );
  static const actionsPadding = EdgeInsets.only(
    left: appSpacing * 2,
    right: appSpacing * 2,
  );
  static const actionsPaddingBottom = EdgeInsets.only(
    left: appSpacing * 2,
    right: appSpacing * 2,
    bottom: appSpacing * 1.125,
  );
  //- dimensions
  static const minimumVisualDensity = VisualDensity(
    horizontal: VisualDensity.minimumDensity,
    vertical: VisualDensity.minimumDensity,
  );
  static const minimumVisualDensityHorizontal = VisualDensity(
    horizontal: VisualDensity.minimumDensity,
  );
  static const minimumVisualDensityVertical = VisualDensity(
    vertical: VisualDensity.minimumDensity,
  );
  static const roundedRectangleBorderTop = RoundedRectangleBorder(
    borderRadius: borderRadiusTop,
  );
  static const circularRadius = Radius.circular(appSpacing * 2);
  static const borderRadiusTop = BorderRadius.only(
    topLeft: circularRadius,
    topRight: circularRadius,
  );
  static const borderRadius = BorderRadius.all(circularRadius);
}
