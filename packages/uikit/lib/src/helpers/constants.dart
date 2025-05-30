import 'package:gap/gap.dart';

/// A4 margins in pixels, standard (25.4mm = 96px), narrow 48px etc.
const appMarginA4 = 96;

/// Base material spacing in logical pixels for consistent UI layout.
///* Small 8px | Standard 16px (8x2) | Large 24px (8x3) etc.
const double appSpacing = 8;

// SystemChannels.textInput.invokeMethod('TextInput.hide');

const appGap = Gap(appSpacing);
