import 'dart:convert';

/// A constant string representing "Not Available" in uppercase.
/// Typically used to indicate that a value is not applicable or missing.
const naUStr = 'N/A';

/// A constant string representing "Not Available" in lowercase. Used for
/// consistency when working with lowercase strings for "Not Available".
const naLStr = 'n/a';

/// A constant string representing "None".
/// Typically used to indicate the absence of a value or selection.
const noneStr = 'None';

/// A constant string representing "All". Often used in selections
/// or filters to represent all available options or items.
const allStr = 'All';

/// A JSON decoder instance for decoding JSON data into Dart objects.
/// Typically used for parsing JSON-encoded strings into Map or List objects.
const jsonDecoder = JsonDecoder();

/// A JSON encoder instance for converting Dart objects into JSON strings.
/// Typically used for serializing Dart objects to JSON format
/// for storage or transmission.
const jsonEncoder = JsonEncoder();

/// A JSON encoder instance with indentation for pretty-printing JSON.
/// Indented with two spaces, this encoder is used to format
/// JSON strings for human readability.
const jsonEncoderIndented = JsonEncoder.withIndent('  ');

/// A boolean indicating whether the app is running in debug mode.
/// This checks the environment and returns true if not in production.
const bool debugMode = !bool.fromEnvironment('dart.vm.product');

const double mmToPoints = 2.83465;

/// A list of basic arithmetic operators and the dot (.) symbol.
const operandsWithDot = ['+', '-', '*', '/', '%', '.'];

// DPI values for 58mm and 80mm thermal printers.
const mm58Dpi = 177.5;
const mm80Dpi = 187.5;
const mm58Str = '80mm';
const mm80Str = '58mm';

class AppDurations {
  static const onboardingAnim = Duration(milliseconds: 300);
  static const Duration popupAnim = Duration.zero;
  static const bottomSheetAnim = Duration(milliseconds: 200);
}
